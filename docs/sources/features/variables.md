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

Learn about variable types in the [Grafana Crash Course](https://grafana.com/docs/plugins/volkovlabs-image-panel/<PLUGINS_VERSION>/exploring-variables/).

## Example of dashboard variable in the Base64 panel

Following is an example of using a dashboard variable to dynamically choose which file to display on the panel. The following blog post describes a project that integrates three open source plugins to upload a file into a database and immediately show what was uploaded.

The plugins used in the example are:

- [Business Forms panel](https://grafana.com/grafana/plugins/volkovlabs-form-panel/) to provide the File type element for file upload.
- [Business Variable panel](https://grafana.com/grafana/plugins/volkovlabs-variable-panel/) to let you choose which file to display.
- [Business Media panel](https://grafana.com/grafana/plugins/volkovlabs-image-panel/) to display the selected file.

Learn more in the following video:

{{< youtube id="V4Sza0uDQNs" >}}
