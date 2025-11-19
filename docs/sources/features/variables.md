---
title: Variables
description: Learn how to use dashboard and global variables with the Business Media panel to create dynamic media displays that respond to user selections.
keywords:
  - business media
  - variables
labels:
  products:
    - oss
    - enterprise
    - cloud
---

# Variables

The Business Media panel supports dashboard and global variables in the `Image URL` panel option.

These three types of variables are explained in the [Grafana Crash Course](https://volkovlabs.io/grafana/variables/).

## Example of dashboard variable in the Base64 panel

Below you can find an example of how a dashboard variable can be used to dynamically determine which file to display on the panel. The following blog post describes a project that integrates three open source plugins to solve the task of uploading a file into a database and then immediately showing what has been uploaded.

The plugins used in the example are:

- [The Business Forms panel](https://grafana.com/grafana/plugins/volkovlabs-form-panel/) to provide with the File type element for file upload.
- [The Business Variable panel](https://grafana.com/grafana/plugins/volkovlabs-variable-panel/) to provide a choice of what file to display.
- [The Business Media panel](https://grafana.com/grafana/plugins/volkovlabs-image-panel/) to display a selected file.

Learn more in the File Upload using Grafana dashboard [blog post](https://volkovlabs.io/blog/form-panel-file-upload-20240310).

If you are a visual style learner, you can watch the video. It covers the same ground.

{{< youtube id="V4Sza0uDQNs" >}}
