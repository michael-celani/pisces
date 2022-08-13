#include <windows.h>
#include <stdio.h>
#include <conio.h>
#include <tchar.h>
#include <vector>

using namespace std;

// File Pointers
vector<HANDLE> handles;
vector<LPCTSTR> files;

extern "C" __declspec(dllexport) double open_file(char* tag, double size)
{
    // Convert the string to LPCWSTR
    WCHAR szName[256];
    memset(szName, 0, sizeof(szName));
    MultiByteToWideChar(CP_ACP, 0, tag, strlen(tag) + 1, szName,
        sizeof(szName) / sizeof(szName[0]));

    int pageSize = (int)size;

    HANDLE hMapFile = CreateFileMapping(
        INVALID_HANDLE_VALUE,    // use paging file
        NULL,                    // default security
        PAGE_READWRITE,          // read/write access
        0,                       // maximum object size (high-order DWORD)
        pageSize,                // maximum object size (low-order DWORD)
        szName);                 // name of mapping object

    if (hMapFile == NULL)
    {
        _tprintf(TEXT("Could not create file mapping object (%d).\n"),
            GetLastError());
        return 1;
    }

    LPCTSTR pBuf = (LPTSTR)MapViewOfFile(hMapFile,   // handle to map object
        FILE_MAP_ALL_ACCESS, // read/write permission
        0,
        0,
        pageSize);

    if (pBuf == NULL)
    {
        _tprintf(TEXT("Could not map view of file (%d).\n"),
            GetLastError());

        CloseHandle(hMapFile);

        return 1;
    }

    handles.push_back(hMapFile);
    files.push_back(pBuf);
    return handles.size() - 1;
}

extern "C" __declspec(dllexport) double close_file(double index)
{
    LPCTSTR pBuf = files[index];
    HANDLE hMapFile = handles[index];

    if (pBuf != NULL) {
        UnmapViewOfFile(pBuf);
        files[index] = NULL;
    }

    if (hMapFile != NULL)
    {
        CloseHandle(hMapFile);
        handles[index] = NULL;
    }
    
    return 0;
}

extern "C" __declspec(dllexport) double copy_to_file(double index, char* data, double size, double offset)
{
    char* pBuf = (char*) files[index];
    pBuf += (int)offset;

    if (pBuf != NULL)
    {
        CopyMemory((PVOID) pBuf, data, size);
    }

    return 0;
}

extern "C" __declspec(dllexport) double copy_from_file(double index, char* data, double size)
{
    LPCTSTR pBuf = files[index];

    if (pBuf != NULL)
    {
        CopyMemory(data, (PVOID)pBuf, size);
    }

    return 0;
}