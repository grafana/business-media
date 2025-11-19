---
title: Supported formats
description: Learn about the various media file formats supported by the Business Media panel, including images, PDFs, videos, and audio files.
keywords:
 - business media
labels:
  products:
    - oss
    - enterprise
    - cloud
weight: 20
---

# Supported formats

The Business Media panel supports the most commonly used file formats.

## Images

The plugin determines the file type automatically based on the first base64 symbol if no definition is provided. This is applicable to the following file formats:

- JPEG
- GIF
- PNG
- HEIC

Other image formats supported by your browser can be rendered with the provided definition of the following pattern `data:image/IMAGE-FORMAT;base64,ENCODED-CONTENT`.

{{< figure src="/media/docs/grafana/panels-visualizations/business-media/panel.png" class="border" alt="The Business Media panel renders images on Grafana dashboard" >}}

## PDF

The plugin renders PDF files with the provided definition `data:application/pdf;base64,ENCODED-CONTENT` or without it.

{{< figure src="/media/docs/grafana/panels-visualizations/business-media/pdf.png" class="border" alt="The Business Media panel renders PDF files on Grafana dashboard" >}}

## Video

The plugin renders video files with the provided definition, as follows:

- MP4: `data:video/mp4;base64,ENCODED-CONTENT`
- WEBM: `data:video/webm;base64,ENCODED-CONTENT`

{{< figure src="/media/docs/grafana/panels-visualizations/business-media/video-comments.png" class="border" alt="The Business Media panel allows to display media files on Grafana dashboard" >}}

## Audio

The plugin outputs audio video files with the provided definition, as follows:

- MP3: `data:audio/mp3;base64,ENCODED-CONTENT`
- OGG: `data:audio/ogg;base64,ENCODED-CONTENT`
