/// @description Run request
card = new CardFactory();
if searchType == "name"
{
	card.PopulateDataViaScryfallName(req);
}
else
{
	card.PopulateDataViaScryfallSearch(req);
}
