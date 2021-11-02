Specifies whether the domain-wide administration port should be enabled for this WebLogic Server domain. Because the administration port uses SSL, enabling the administration port requires that SSL must be configured for all servers in the domain.

The domain-wide administration port enables you to start a WebLogic Server instance in STANDBY state. It also allows you to separate administration traffic from application traffic in your domain. Because all servers in the domain must enable or disable the administration port at once, you configure the default administration port settings at the domain level.

If you enable the administration port:

The administration port accepts only connections that specify administrator credentials.

Connections that specify administrator credentials can use only the administration port.

The command that starts managed servers must specify a secure protocol and the administration port: -Dweblogic.management.server=https://admin_server:administration_port

