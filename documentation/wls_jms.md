---
title: wls jms
keywords: documentation
layout: documentation
sidebar: wls_profile_sidebar
toc: false
---
## Overview

This class is the default implementation for defining WebLogic JMS setup. 

Using hiera, you you can customize some of the aspects of this proces.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.





## Attributes



Attribute Name                      | Short Description               |
----------------------------------- | ------------------------------- |
[module_list](#wls_jms_module_list) | A list of modules to define.    |
[queue_list](#wls_jms_queue_list)   | A list of JMS queues to define. |
[topic_lis](#wls_jms_topic_lis)     | A list of JMS topics to define. |




### module_list<a name='wls_jms_module_list'>



A list of modules to define.

The default value is: `{}`

This is a simple way to get started. It is easy to get started, but soon your hiera yaml become a nigtmare. Our advise is when you need to let puppet manage your Oracle profiles, to override this class and  add your own puppet implementation. This is much better maintainable
and adds more consistency.

[Back to overview of wls_jms](#attributes)


### queue_list<a name='wls_jms_queue_list'>



A list of JMS queues to define.

The default value is: `{}`

This is a simple way to get started. It is easy to get started, but soon your hiera yaml become a nigtmare. Our advise is when you need to let puppet manage your Oracle profiles, to override this class and  add your own puppet implementation. This is much better maintainable
and adds more consistency.

[Back to overview of wls_jms](#attributes)


### topic_lis<a name='wls_jms_topic_lis'>



A list of JMS topics to define.

The default value is: `{}`

This is a simple way to get started. It is easy to get started, but soon your hiera yaml become a nigtmare. Our advise is when you need to let puppet manage your Oracle profiles, to override this class and  add your own puppet implementation. This is much better maintainable
and adds more consistency.

[Back to overview of wls_jms](#attributes)

