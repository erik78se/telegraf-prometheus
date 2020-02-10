# Overview

telegraf-centos monitors a centos7 node with telegraf.

It has a single endpoint: prometheus-client (interface: http) which allows for a relation
to prometheus2:target (interface: http)

# Usage

This deploys a centos7 node relates it to this charm for monitoring.
<pre>
# Deploy a bulk centos charm
$ juju deploy cs:~erik-lonroth/tiny-bash-centos

# Deploy the telegraf-prometheus
$ juju deploy telegraf-prometheus

# Relate the subordinate.
$ juju relate telegraf-prometheus tiny-bash

# Relate telegraf to prometheus
$ juju relate prometheus2:target telegraf-prometheus:prometheus-client
</pre>

You should now be able to browse to your prometheus web and see the target.