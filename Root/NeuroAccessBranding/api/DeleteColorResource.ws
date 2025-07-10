AuthenticateSession(Request,"User");
Authorize(User,"Admin.Presentation.NeuroAccessBranding");

if !(Posted matches {"name": PName})
    then BadRequest("Invalid payload");

delete from Waher.Service.IoTBroker.PubSub.PubSubItem WHERE Service="" AND Node="NeuroAccessResources" AND ItemId=PName;