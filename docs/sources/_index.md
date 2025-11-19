---
title: Business Media
description: Learn how to display multiple media files including images, videos, audio, and PDFs on your Grafana dashboards using the Business Media panel plugin.
keywords:
 - business media
labels:
  products:
    - oss
    - enterprise
    - cloud
weight: 10
---

# Business Media

The Business Media panel is a Grafana plugin that renders PNG, JPG, GIF, MP4, WEBM, MP3, OGG, and PDF files encoded in the base64 format and URL.

The panel offers great flexibility, allowing users to display multiple media files and flip through them. You can mix and match any supported formats for multi-media file visualizations, allowing you to create the desired visual experience.

## Requirements

The Business Media panel version requirements for Grafana are as follows:

- Business Media panel 7.X requires **Grafana 11** or **Grafana 12**.
- Business Media panel 6.X requires **Grafana 10** or **Grafana 11**.
- Business Media panel 5.X requires **Grafana 10** or **Grafana 11**.
- Base64 Image/PDF panel 4.X requires **Grafana 9** or **Grafana 10**.
- Base64 Image/PDF panel 3.X requires **Grafana 8.5** or **Grafana 9**.
- Base64 Image/PDF panel 2.X requires **Grafana 8**.
- Base64 Image/PDF panel 1.X requires **Grafana 7.1**.

## Getting started

The Business Media panel can be installed from the [Grafana Plugins catalog](https://grafana.com/grafana/plugins/volkovlabs-image-panel/) or using the Grafana command line tool.

{{< youtube id="1qYzHfPXJF8" >}}

For the latter, please use the following command.

```sh
grafana cli plugins install volkovlabs-image-panel
```

## Highlights

- The media file can be specified in the base64 format or as a URL link.
- Multiple media files display with pagination functionality.
- The returned value can include base64 encoded content with or without a specified definition. The formats for the definition can look like `data:image/jpg;base64,ENCODED-CONTENT` or `data:application/pdf;base64,ENCODED-CONTENT`.
- If the data source returns more than one field of the `string` type, you can select the Field Name in the panel's display options.
- You can fit image dimensions to the panel size, keep the original values, or adjust dimensions based on the manually supplied values.
- Allows adding a URL with a title to navigate to other dashboards when clicking the image. URL supports dashboard variables.
- Provides a toolbar to download, zoom, and navigate between media files.

{{< figure src="/media/docs/grafana/panels-visualizations/business-media/media-7.png" class="border" alt="How to start with the Business Media panel" >}}

## Tutorial

This tutorial explains all plugin options in version 5.0.0.

You will learn how to display images, video, audio and PDF files on your Grafana dashboard. The tutorial demonstrates how to set up the toolbar, URL links, image scaling and other parameters.

{{< youtube id="hLMtsCWPOg8" >}}

There are many other tutorials that you can find helpful. You can review [all tutorials related to this plugin](http://grafana.com/docs/plugins/volkovlabs-image-panel/<PLUGINS_VERSION>/tutorials/).

## Documentation

| Section                      | Description                                                         |
| ---------------------------- | ------------------------------------------------------------------- |
| [Supported formats](http://grafana.com/docs/plugins/volkovlabs-image-panel/<PLUGINS_VERSION>/formats/) | Explains what formats are supported and how to display media files. |
| [Options](http://grafana.com/docs/plugins/volkovlabs-image-panel/<PLUGINS_VERSION>/options)           | Describes all plugin options                                        |
| [Features](http://grafana.com/docs/plugins/volkovlabs-image-panel/<PLUGINS_VERSION>/features/)         | Demonstrates panel capabilities.                                    |
| [Tutorials](http://grafana.com/docs/plugins/volkovlabs-image-panel/<PLUGINS_VERSION>/tutorials/)       | Easy to follow tutorials                                            |
| [Release notes](http://grafana.com/docs/plugins/volkovlabs-image-panel/<PLUGINS_VERSION>/release/)     | Stay up to date with the latest features and updates.               |

## License

Apache License Version 2.0, see [LICENSE](https://github.com/grafana/business-media/blob/main/LICENSE).
