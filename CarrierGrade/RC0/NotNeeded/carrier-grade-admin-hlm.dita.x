<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE topic
  PUBLIC "-//OASIS//DTD DITA Topic//EN" "http://docs.oasis-open.org/dita/v1.1/OS/dtd/topic.dtd" ><topic xml:lang="en-us" id="topic2780">
<title>HP Helion <tm tmtype="reg">OpenStack</tm> Carrier Grade 1.1: Using Helion Lifecycle Management</title>
<prolog>
<metadata>
<othermeta name="layout" content="default"/>
<othermeta name="product-version" content="HP Helion Openstack"/>
<othermeta name="product-version" content="HP Helion Openstack 1.1"/>
<othermeta name="role" content="All"/>
<othermeta name="role" content="Paul F"/>
<othermeta name="product-version1" content="HP Helion Openstack"/>
<othermeta name="product-version2" content="HP Helion Openstack 1.1"/>
</metadata>
</prolog>
<body>
<p>
<!--UNDER REVISION-->
 <!--./CarrierGrade/Admin_Guide/carrier-grade-admin-hlm.md-->
 <!--permalink: /helion/openstack/carrier/admin/hlm/--></p>
<p>Using HLM, you can install and upgrade HP Helion <tm tmtype="reg">OpenStack</tm> Carrier Grade and can perform the following:</p>
<!-- From Kenobi LCM4Cloud.pptx per Bryan Murray -->
<section id="provisioning"> <title>Provisioning</title>
<ul>
<li>Provision &lt;Type&gt; Node</li>
<li>Deprovision &lt;Type&gt; Node</li>
<li>Prepare SAN Storage to boot &lt;Type&gt; Node</li>
<li>Prepare additional SAN Storage for &lt;Type&gt; Node</li>
<li>Prepare additional local storage for &lt;Type&gt; Node</li>
<li>Prepare Bonded NIC for &lt;Type&gt; Node</li>
<li>Provision virtual &lt;Type&gt; Node on physical &lt;Type&gt; Node</li>
<li>Deprovision virtual &lt;Type&gt; Node on physical &lt;Type&gt; Node</li>
<li>Determine NIC port enumeration map for &lt;Type&gt; Node</li>
<li>Determine Storage map for &lt;Type&gt; Node</li>
</ul>
</section>
<section id="deployment"> <title>Deployment</title>
<ul>
<li>Build &lt;Type&gt; Control Plane - Service Tier &lt;ID&gt;</li>
<li>Destroy &lt;Type&gt; Control Plane - Service Tier &lt;ID&gt;</li>
<li>Build &lt;Type&gt; Resource Cluster</li>
<li>Destroy &lt;Type&gt; Resource Cluster</li>
<li>Add Member to &lt;Type&gt; Control Plane - Service Tier &lt;ID&gt;</li>
<li>Remove Member from &lt;Type&gt; Control Plane - Service Tier &lt;ID&gt;</li>
<li>Add &lt;Type&gt; Resource Single Node to &lt;Type&gt; Control Plane</li>
<li>Remove &lt;Type&gt; Resource Single Node from &lt;Type&gt; Control Plane</li>
<li>Add &lt;Type&gt; Resource Cluster to &lt;Type&gt; Control Plane</li>
<li>Remove &lt;Type&gt; Resource Cluster from &lt;Type&gt; Control Plane</li>
</ul>
</section>
<section id="maintenance"> <title>Maintenance</title>
<ul>
<li>Modify &lt;Type&gt; Control Plane Options</li>
<li>Offline Member &lt;ID&gt; of &lt;Type&gt; Control Plane - Service Tier &lt;ID&gt;</li>
<li>Online Member &lt;ID&gt; of &lt;Type&gt; Control Plane - Service Tier &lt;ID&gt;</li>
<li>Offline &lt;Type&gt; Resource Single &lt;ID&gt;</li>
<li>Online &lt;Type&gt; Resource Single &lt;ID&gt;</li>
<li>Offline &lt;Type&gt; Resource Cluster &lt;ID&gt;</li>
<li>Online &lt;Type&gt; Resource Cluster &lt;ID&gt;</li>
<li>Audit &lt;Type&gt; Resource Node compliance</li>
</ul>
</section>
<section id="recovery"> <title>Recovery</title>
<ul>
<li>Backup data from &lt;Type&gt; Control Plane</li>
<li>Restore data to a &lt;Type&gt; Control Plane</li>
<li>Rebuild &lt;Type&gt; Control Plane - Service Tier &lt;ID&gt;</li>
<li>Rebuild &lt;Type&gt; Resource Cluster</li>
<li>Rebuild &lt;Type&gt; Cloud Instance &lt;ID&gt;</li>
</ul>
</section>
<section id="migration"> <title>Migration</title>
<ul>
<li>Offline Migration of &lt;Type&gt; Control Plane:  &lt;Type&gt; Service Cluster from Service Tier &lt;ID&gt; to Service Tier &lt;ID&gt;</li>
<li>Rolling Migration of &lt;Type&gt; Control Plane:  &lt;Type&gt; Service Cluster from Service Tier &lt;ID&gt; to Service Tier &lt;ID&gt;</li>
<li>Offline Migration of &lt;Type&gt; Control Plane:  &lt;Type&gt; Service Single from Service Tier &lt;ID&gt; to Service Tier &lt;ID&gt;</li>
</ul>
</section>
<section id="updateupgrade"> <title>Update/Upgrade</title>
<ul>
<li>Rolling Hot-fix to &lt;Type&gt; Control Plane</li>
<li>Rolling Hot-fix to &lt;Type&gt; Resource Single</li>
<li>Rolling Hot-fix to &lt;Type&gt; Resource Cluster</li>
<li>Rolling Update to &lt;Type&gt; Control Plane</li>
<li>Rolling Update to &lt;Type&gt; Resource Single</li>
<li>Rolling Update to &lt;Type&gt; Resource Cluster</li>
<li>Rolling Upgrade to &lt;Type&gt; Control Plane</li>
<li>Rolling Upgrade to &lt;Type&gt; Resource Single</li>
<li>Rolling Upgrade to &lt;Type&gt; Resource Cluster</li>
</ul>
<!-- Taken from https://rndwiki2.atlanta.hp.com/confluence/display/cloudos/HLM+Command+Line+Interface

A.  Deploy cloud. An entire cloud is deployed. 

B.  Stop component. A service component is stopped. 

C.  Start service or component in a given control plane. Start and stop can operate on both entire services, or components on the service. 

D.  Restart service. All of the components of the service are restarted. 

E.  Apply a patch to a cloud

F.  Apply a hot-fix to a cloud

G.  Apply a software update to a cloud

H.  Upgrade the cloud. Not supported by HCSP 1.0. 

I.  Change the configuration of the cloud. Cloud configuration changes include changing properties for a given service component, adding a new service, and adding/removing resource nodes.

J.  Rollback the configuration of the cloud. Revert to a previous checkpoint of the cloud configuration. 

K.  Add a compute node to a resource pool. Adding and removing resource nodes. 

L.  Modify the security credentials for mysql

M.  Modify configuration of Swift rings

N.  Put a node into maintenance mode

O.  Shutdown a control plane

P.  Add/remove a control plane. This is not something that will be published to customers, but not something we need to prevent

Q.  Create cloud definition

R.  List sample clouds

S.  Provision nodes to be used in cloud

T.  Display current cloud topology

U.  Display the desired state cloud topology. 

V.  Explain current/desired state cloud topology
-->
<p>
  <xref type="section" href="#topic2780"> Return to Top </xref>
</p>
<!-- ===================== horizontal rule ===================== -->
</section>
</body>
</topic>
