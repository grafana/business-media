---
title: Options
description: Learn how to configure all available options for the Business Media panel, including display settings, toolbar features, and media-specific parameters.
keywords:
  - business media
labels:
  products:
    - oss
    - enterprise
    - cloud
weight: 30
---

# Options

Below, you can find descriptions of all existing plugin options. The Business Media panel allows for the simultaneous displaying of multi-type media files. The three categories of options (**PDF**, **Image**, **Video/Audio**) are conditionally available depending on the added **Media Source Types** in the **Business Media** category.

{{< figure src="/media/docs/grafana/panels-visualizations/business-media/options.png" class="border" alt="All the Business Media panel options" >}}

## Business Media

The **Business Media** category has the following parameters:

- **Type** to specify one of the four supported types. Select between Audio, Image, PDF, or Video.
- **Field** to specify the data frame field name containing a base64 file to display on the panel.

You can specify as many files as needed by using the **+Add** button.

{{< figure src="/media/docs/grafana/panels-visualizations/business-media/opt-bm.png" class="border" alt="The parameters of the Business Media category" >}}

## Text Options

The **Text Options** category has the following parameters:

- **Field description** is a description displayed under the image specified as a data frame column name.

{{< figure src="/media/docs/grafana/panels-visualizations/business-media/img-desc.png" class="border" alt="Image description illustration" >}}

{{< admonition type="note" >}}
Starting from release 5.0.0, you can customize a message displayed in case of image loading problems or no data found errors.
{{< /admonition >}}

- **No Results Message** customizable message to notify users of loading problems or no data found errors.

{{< figure src="/media/docs/grafana/panels-visualizations/business-media/nothing.png" class="border" alt="No Result Message illustration" >}}

## Toolbar

The Business Media panel offers a powerful toolbar. By enabling the **Display toolbar** and specifying the desired **Features**, you can customize it to suit your needs.

{{< figure src="/media/docs/grafana/panels-visualizations/business-media/toolbar.png" class="border" alt="The Toolbar section and available features" >}}

- **Auto play**. Works when multiple media files are added. When a user clicks on the **Play** toolbar button, the images will switch from the first to the following with the specified **Auto play interval** until the last image.
  If the **Auto Play infinity** is **Enabled**, then the switching starts again from the beginning automatically.

{{< figure src="/media/docs/grafana/panels-visualizations/business-media/auto-switch.png" class="border" alt="The Toolbar feature - Auto Play" >}}

- **Download**. Works for the **Image** type only. This enables a button that triggers the downloading of the selected image.
- **Navigation**. This enables a set of buttons to page media files back and forward.
- **Zoom**. Works for the **Image** type only. This option has two sub-options:
  - **Full Screen**. This enables one button that allows your image to be opened in full-screen mode.
  - **Pan and Pinch**. This enables three buttons to zoom in and out of your image.

{{< figure src="/media/docs/grafana/panels-visualizations/business-media/down-nav-zoom.png" class="border" alt="The Toolbar features - Download, Navigation, Zoom" >}}

## URL

{{< admonition type="note" >}}
Starting from version 6.1.0, the **URL** category became obsolete since Grafana added the **Data links** category, which is fully supported by the Business Media panel.
{{< /admonition >}}

In the **URL** category, you can specify two parameters:

- **Image URL**. This address will be opened after a user clicks on the image.
- **Title**. This text will pop up when a user hovers a mouse over the image.

{{< figure src="/media/docs/grafana/panels-visualizations/business-media/url.png" class="border" alt="In the URL category, you can specify the Image URL address and the Title" >}}

## PDF

Most browsers have a PDF toolbar by default. You can disable that default if needed.

{{< figure src="/media/docs/grafana/panels-visualizations/business-media/pdf.png" class="border" alt="The Business Media panel provides an option to disable a browser's PDF toolbar" >}}

## Image

In the **Image** category there is one drop-down parameter **Scale Algorithm** to specify how scaling of the image should be done. We have three options to choose from:

- **Auto**. A browser chooses the best available algorithm.
- **Crisp Edges**. The image is scaled with an algorithm that preserves contrast and edges in the image. Generally intended for images such as pixel art or line drawings, no blurring or color smoothing occurs.
- **Pixelated**. The image is scaled with the "nearest neighbor" or similar algorithm, preserving a "pixelated" look as the image changes in size.

{{< admonition type="note" >}}
The **Crisp Edges** option is not supported in all browsers: https://developer.mozilla.org/en-US/docs/Web/CSS/image-rendering
{{< /admonition >}}

{{< figure src="/media/docs/grafana/panels-visualizations/business-media/auto-pix.png" class="border" alt="Difference between Auto and Pixelated Scale Algorithms" >}}

## Video/Audio

In the **Video/Audio** category, there are specific to these formats parameters:

- **Controls**. **Enabled** instructs the panel to display the video and audio controls.
- **Auto Play**. When **Enabled**, the video and audio automatically start playing without sound.
- **Infinity Play**. With **Enabled**, the file plays in an endless loop.
- **Poster Image**. You can specify a poster image (thumbnail) file for your video files. A poster image is an image that is shown before the user clicks on the play button (unless the **Auto play** is enabled). The image can be in the base64 format or a link to the external web resource.

{{< figure src="/media/docs/grafana/panels-visualizations/business-media/video.png" class="border" alt="Parameters for video and audio files" >}}

## Width and Height

The **Width** and **Height** categories allow control of the image size on the dashboard.

{{< figure src="/media/docs/grafana/panels-visualizations/business-media/w-h.png" class="border" alt="The sizing options for images" >}}

- **Panel**. The width or height will fit the current panel size.
- **Original**. The width or height will be taken from the original file.
- **Custom**. Here you can either take the sizing from the connected data frame field or give a specific number in pixels.
- **Original with scroll**. You can allow scrolling only horizontally, vertically, or simultaneously in both directions.

{{< video-embed src="/media/docs/grafana/panels-visualizations/business-media/scroll.gif" >}}

## Data links

{{< admonition type="note" >}}
The **Data links** feature is supported starting from the Business Media panel version 6.1.0
{{< /admonition >}}

Following Grafana 11 new features, we removed previously existing image links (the **URL** category) and allowed using a new **Data links** feature instead.

{{< figure src="/media/docs/grafana/panels-visualizations/business-media/link.png" class="border" alt="Use the Data links category to create links from Business Media panel" >}}

The links can open in the same tab or a new tab.

{{< figure src="/media/docs/grafana/panels-visualizations/business-media/link-edit.png" class="border" alt="The links can open in the same tab or a new tab" >}}
