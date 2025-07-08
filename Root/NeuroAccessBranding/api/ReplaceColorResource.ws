AuthenticateSession(Request,"User");
Authorize(User,"Admin.Data.Nodes");

if !(Posted matches {xml: PXml, resourceName: PResourceName}) then
    BadRequest("invalid post data");

Resource:=select top 1 * from Waher.Service.IoTBroker.PubSub.PubSubItem WHERE Service="" AND Node="NeuroAccessResources" AND ItemId=PResourceName;

Resource.Payload:= PXml;
UpdateObject(Resource);

{
    success: true
}