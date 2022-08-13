attribute vec3 in_Position;                  // (x,y,z)
attribute vec3 in_Normal;                    // (qu,qv,q)
attribute vec4 in_Colour;                    // (r,g,b,a)
//attribute vec2 in_TextureCoord;            // (u,v)       unused in this shader.

varying vec4 v_vColour;
varying vec3 v_vCoord;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;    
    v_vColour = in_Colour;
    v_vCoord = in_Normal;
}

