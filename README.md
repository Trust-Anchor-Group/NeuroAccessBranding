# Neuro Access Branding

A service that allows administrators of a Neuron to manage branding Pub-Sub node access and customize color themes.

## Installable Package
 Z
The Neuro Access Branding service has been made into a package that can be downloaded and installed on any 
[TAG Neuron](https://lab.tagroot.io/Documentation/Index.md). To create a package, that can be distributed or installed, you begin by creating 
a *manifest file*. This repository contains a manifest file called `NeuroAccessBranding.manifest`. It defines the content files included in the package. 
You then use the `Waher.Utility.Install` and `Waher.Utility.Sign` command-line tools in the [IoT Gateway](https://github.com/PeterWaher/IoTGateway) 
repository, to create a package file and cryptographically sign it for secure distribution across the Neuron network.

The Neuro Access Branding service is published as a package on TAG Neurons. If your Neuron is connected to this network, you can install the
package using the following information:

| Package information                                                                                                              ||
|:-----------------|:---------------------------------------------------------------------------------------------------------------|
| Package          | `TAG.NeuroAccess.package`                                                                                        |
| Installation key | `tSJd4+7X7nrs8FfpyNm4WFpVyRS82zZ7U2okMM5xIT5KI5DB9dPKGs9YkgwYokn6qmvNtYoTrfuAb5d17fb372917b678d3a9e51e7007911` |
| More Information |                                                                                                                |

## Development

The Neuro Access Branding service runs on any [IoT Broker Host](https://lab.tagroot.io/Documentation/Neuron/InstallBroker.md) which you can run on your local machine. To simplify development, once the project is cloned, add a `FileFolder` reference to your repository folder in your [gateway.config file](https://lab.tagroot.io/Documentation/IoTGateway/GatewayConfig.md). This allows you to test and run your changes immediately, without having to synchronize the folder contents with an external host, or go through the trouble of generating a distributable software package just for testing purposes.

Example:

```
<FileFolders>
  <FileFolder webFolder="/NeuroAccessBranding" folderPath="C:\My Projects\NeuroAccessBranding\Root\NeuroAccessBranding"/>
</FileFolders>
```

**Note**: Once the file folder reference is added, you need to restart the IoT Broker service for the change to take effect.

## Main Page

The main page of the community service is `/NeuroAccessBranding/Index.md`.
