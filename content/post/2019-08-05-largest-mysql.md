---
layout: post
title: "Show largest mysql tables"
date:   2019-08-05 00:00:00
comments: true
published: true
categories:
  - mysql
---

Here is a small sql commando to show the largest mysql tables on your system.

{{< highlight sql >}}
SELECT 
     table_schema as `Database`, 
     table_name AS `Table`, 
     round(((data_length + index_length) / 1024 / 1024), 2) `Size in MB` 
FROM information_schema.TABLES 
ORDER BY (data_length + index_length) DESC
LIMIT 10;
{{< / highlight >}}

Thank you http://www.mysqlperformanceblog.com/2008/02/04/finding-out-largest-tables-on-mysql-server/ for the code.
