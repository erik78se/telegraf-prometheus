# Overview

telegraf-prometheus for centos7 monitors with telegraf.

* It adds in a [influxdata yum repo] repo to /etc/yum.repos.d/ which enables installation of telegraf and influxdb
* Configures the listen port for prometheus-client and starts the services.
* If there is a nvidia-smi + kernel driver, its collecting gpu information per default. 
(This check can be disabled with a charm config )

The charm allows for a relation (:prometheus-client) with [prometheus]  (:target)

## Example deploy

The below deploys a monitoring stack of:
 
* A centos7 bash charm: [tiny-bash-centos]
    * This subordinate charm: [telegrapf-prometheus]
* A prometheus charm: [prometheus]

<pre>
# Deploy prometheus2
juju deploy prometheus2

# Deploy a bulk centos charm
$ juju deploy cs:~erik-lonroth/tiny-bash-centos

# Deploy the telegraf-prometheus
$ juju deploy telegraf-prometheus

# Relate the subordinate.
$ juju relate telegraf-prometheus tiny-bash

# Relate telegraf to prometheus2
$ juju relate prometheus2:target telegraf-prometheus:prometheus-client
</pre>

You should now be able to browse to your prometheus web and see the target in the web ui.

You can also use the [prometheus] endpoint in [grafana] as a [DataSource] to get nice looking graphs.

## Charm configuration
You can configure which port the telegraf serivice listen to which prometheus can scrape:
<pre>
juju config telegraf-prometheus port=9103
</pre>

You can disable checks with nvidia-smi if you need:
<pre>
juju config telegraf-prometheus disable_nvidia_smi=true
</pre>

## Operator actions/functions
This charm does not have any functions/actions yet.

# More work wanted (your contribution?)
* Add more interfaces like the telegraf charm for ubuntu, like support for elastic-search etc.
* Support other distros, such as ubuntu and centos8.

[influxdata yum repo]: https://repos.influxdata.com/rhel/7/x86_64/stable/
[grafana]: https://jaas.ai/grafana
[DataSource]: https://grafana.com/docs/grafana/latest/features/datasources/
[prometheus]: https://jaas.ai/prometheus2
[telegrapf-prometheus]: https://jaas.ai/telegraf-prometheus
[tiny-bash-centos]: https://jaas.ai/u/erik-lonroth/tiny-bash-centos
[interface: http]: https://github.com/juju-solutions/interface-http