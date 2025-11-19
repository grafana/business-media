---
title: Data sources
description: Learn how to connect the Business Media panel to various data sources to retrieve and display media files stored in Base64 format.
keywords:
 - business media
labels:
  products:
    - oss
    - enterprise
    - cloud
---

# Data sources

The Business Media panel retrieves media data from the connected data source. You can use any suitable option to retrieve data in the base64 format.

A Business Input data source is the quickest way to get started. PostgreSQL is also an excellent choice.

## Business Input

You can use a [Business Input data source](https://grafana.com/grafana/plugins/marcusolsson-static-datasource/) to retrieve any supported Base64 formats and render them on your Grafana dashboard.

{{< admonition type="note">}}

The Business Input data source is an option for storing and retrieving small and medium-sized files. If you get the `413 Request Entity Too Long` error, it means that you have exceeded Grafana limits. You need to switch to the database or storage data source; PostgreSQL is an excellent choice for this.

{{< /admonition >}}

## PostgreSQL

For media files, the data source must return base64 encoded file content and may return a format definition such as `data:video/mp4;base64,ENCODED-CONTENT`.

```sql
SELECT
  concat(
    'data:video/mp4;base64,',
    encode(video, 'base64')
  ) as video
from
  videos
where
  name = 'flow';
```

{{< figure src="/media/docs/grafana/panels-visualizations/business-media/video-comments.png" class="border" alt="The Business Media panel displays media files on Grafana dashboard" >}}

The PostgreSQL database includes functions for working with the Base64 format.

```sql
SELECT CONVERT_FROM (DECODE('SGVsbG8gV29ybGQh', 'BASE64'), 'UTF-8');
SELECT ENCODE (CONVERT_TO('Hello World!', 'UTF-8'), 'BASE64');
```

### Loading media files into the database

Create tables to store images, video, and audio files.

```sql
CREATE TABLE images (name text, img bytea, UNIQUE(name));
CREATE TABLE videos (name text, video bytea, UNIQUE(name));
CREATE TABLE audios (name text, audio bytea, UNIQUE(name));
```

Load PDF, PNG, MP4, MP3, and other supported file formats into your database using [the Node.js script](https://github.com/grafana/business-media/blob/main/postgres/load.ts).

## Websocket and MQTT

[This blog post](https://volkovlabs.io/blog/streaming-images-business-media-20240903/) contains an example of effective collaboration between the Business Forms panel and two data sources (the Websocket and MQTT) to facilitate streaming images on your Grafana dashboard.
