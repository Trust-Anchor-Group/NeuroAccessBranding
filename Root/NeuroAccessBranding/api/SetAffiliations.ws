AuthenticateSession(Request,"User");
Authorize(User,"Admin.Presentation.NeuroAccessBranding");

if not (Posted matches { affiliations: PAffiliations[] }) then
    BadRequest("Invalid post 1");

if not (PAffiliations matches {jid: PJid, affiliation: PAffiliation}[]) then
    BadRequest("Invalid post");

PubSubComp:=null;
Components:=Waher.Runtime.Inventory.Types.GetType("Waher.Service.IoTBroker.XmppServerModule").get_Server().get_Components();

foreach(Component in Components) do 
    if (Component.GetType() = Waher.Service.IoTBroker.PubSub.PubSubComponent) then
        PubSubComp:= Component;

BrandingNode:=PubSubComp.GetNodeAsync("", "NeuroAccessBranding", null, XmppAddress.Empty, "");
ResourcesNode:=PubSubComp.GetNodeAsync("", "NeuroAccessResources", null, XmppAddress.Empty, "");

Affiliations:=BrandingNode.GetAffiliations();

foreach(PAffiliation in PAffiliations) do (
    Jid:=Create(Waher.Persistence.CaseInsensitiveString, PAffiliation.jid);
    NewStatus:=System.Enum.Parse(Waher.Service.IoTBroker.PubSub.AffiliationStatus, PAffiliation.affiliation);
    NeuronAddress:=Create(Waher.Networking.XMPP.Server.XmppAddress, Gateway.XmppClient.get_BareJID());
    BrandingNode.SetAffiliation(Jid, NewStatus);
    ResourcesNode.SetAffiliation(Jid, NewStatus);
);

UpdateObject(BrandingNode);
UpdateObject(ResourcesNode);

{
    success: true
}