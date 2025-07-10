AuthenticateSession(Request, "User");
Authorize(User, "Admin.Presentation.NeuroAccessBranding");

if !(Posted matches {resourceName: PResourceName, colors: PColors[]}) then
    BadRequest("invalid post data");

if !(PColors matches {name: PColorName, color: PColor}[]) then
    BadRequest("invalid colors");

Resource:=select top 1 * from Waher.Service.IoTBroker.PubSub.PubSubItem WHERE Service="" AND Node="NeuroAccessResources" AND ItemId=PResourceName;

if (Resource = null) then
    BadRequest("No such resource");

sb:=Create(System.Text.StringBuilder);
sb.Append('<ResourceDictionary xmlns="http://schemas.microsoft.com/dotnet/2021/maui" xmlns:x="http://schemas.microsoft.com/winfx/2009/xaml">');

foreach Color in PColors do (
    sb.Append('<Color x:Key="');
    sb.Append(XmlEncode(Color.name));
    sb.Append('">');
    sb.Append(XmlEncode(Color.color));
    sb.Append('</Color>');
);

sb.Append('</ResourceDictionary>');

Resource.Payload:= sb.ToString();
UpdateObject(Resource);

{
    success: true
}