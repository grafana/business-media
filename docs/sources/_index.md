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

The Business Media panel is a Grafana plugin that renders PNG, JPG, GIF, MP4, WEBM, MP3, OGG, and PDF files encoded in base64 or as a URL.

You can display multiple media files and flip through them. Mix and match any supported formats for multimedia visualizations. Create the visual experience you want.

## Requirements

The Business Media panel requires the following Grafana versions:

- Version 7.X: **Grafana 11** or **Grafana 12**
- Version 6.X: **Grafana 10** or **Grafana 11**
- Version 5.X: **Grafana 10** or **Grafana 11**
- Base64 Image/PDF panel 4.X: **Grafana 9** or **Grafana 10**
- Base64 Image/PDF panel 3.X: **Grafana 8.5** or **Grafana 9**
- Base64 Image/PDF panel 2.X: **Grafana 8**
- Base64 Image/PDF panel 1.X: **Grafana 7.1**

## Getting started

Install the Business Media panel from the [Grafana Plugins catalog](https://grafana.com/grafana/plugins/volkovlabs-image-panel/) or by using the Grafana command line tool.

To install with the CLI, run:

```sh
grafana cli plugins install volkovlabs-image-panel
```

## Highlights

- Specify the media file in base64 or as a URL.
- Display multiple media files with pagination.
- Return base64 content with or without a definition, such as `data:image/jpg;base64,ENCODED-CONTENT` or `data:application/pdf;base64,ENCODED-CONTENT`.
- If the data source returns more than one `string` field, select the field name in the panel display options.
- Fit image dimensions to the panel, keep original values, or set manual dimensions.
- Add a URL with a title to navigate to other dashboards when clicking the image. URLs support dashboard variables.
- Use the toolbar to download, zoom, and navigate between media files.

{{< figure src="/media/docs/grafana/panels-visualizations/business-media/media-7.png" class="border" alt="How to start with the Business Media panel" >}}

## Documentation

| Section                      | Description                                                         |
| ---------------------------- | ------------------------------------------------------------------- |
| [Supported formats](http://grafana.com/docs/plugins/volkovlabs-image-panel/<PLUGINS_VERSION>/formats/) | Explains what formats are supported and how to display media files. |
| [Options](http://grafana.com/docs/plugins/volkovlabs-image-panel/<PLUGINS_VERSION>/options)           | Describes all plugin options                                        |
| [Features](http://grafana.com/docs/plugins/volkovlabs-image-panel/<PLUGINS_VERSION>/features/)         | Demonstrates panel capabilities.                                    |
| [Release notes](http://grafana.com/docs/plugins/volkovlabs-image-panel/<PLUGINS_VERSION>/release/)     | Stay up to date with the latest features and updates.               |

## License

Apache License Version 2.0, see [LICENSE](https://github.com/grafana/business-media/blob/main/LICENSE).
