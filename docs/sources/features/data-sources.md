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

The Business Media panel retrieves media data from the connected data source. Use any option that returns data in base64 format.

A Business Input data source is the quickest way to get started. PostgreSQL is also a good choice.

## Business Input

Use a [Business Input data source](https://grafana.com/grafana/plugins/marcusolsson-static-datasource/) to retrieve any supported base64 formats and render them on your Grafana dashboard.

{{< admonition type="note">}}

The Business Input data source is best for storing and retrieving small or medium files. If you get a `413 Request Entity Too Long` error, you have exceeded Grafana limits. Switch to a database or storage data source. PostgreSQL is a good choice.

{{< /admonition >}}

## PostgreSQL

For media files, the data source must return base64-encoded file content. It may also return a format definition such as `data:video/mp4;base64,ENCODED-CONTENT`.

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

PostgreSQL includes functions for working with the base64 format.

```sql
SELECT CONVERT_FROM (DECODE('SGVsbG8gV29ybGQh', 'BASE64'), 'UTF-8');
SELECT ENCODE (CONVERT_TO('Hello World!', 'UTF-8'), 'BASE64');
```

### Loading media files into the database

Create tables to store images, video, and audio files:

```sql
CREATE TABLE images (name text, img bytea, UNIQUE(name));
CREATE TABLE videos (name text, video bytea, UNIQUE(name));
CREATE TABLE audios (name text, audio bytea, UNIQUE(name));
```

Load PDF, PNG, MP4, MP3, and other supported file formats into your database using [the Node.js script](https://github.com/grafana/business-media/blob/main/postgres/load.ts).
