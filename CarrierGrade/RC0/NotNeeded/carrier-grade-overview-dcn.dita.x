<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE topic
  PUBLIC "-//OASIS//DTD DITA Topic//EN" "http://docs.oasis-open.org/dita/v1.1/OS/dtd/topic.dtd" ><topic xml:lang="en-us" id="topic4470">
<title>HP Helion <tm tmtype="reg">OpenStack</tm> Carrier Grade 1.1: Distributed Cloud Networking (DCN) Overview</title>
<titlealts>
<searchtitle>HP Helion Openstack Carrier Grade 1.1: Distributed Cloud Networking Overview</searchtitle>
</titlealts>
<prolog>
<metadata>
<othermeta name="layout" content="default"/>
</metadata>
</prolog>
<body>
<p>
<!--UNDER REVISION-->
 <!--./CarrierGrade/Overview/carrier-grade-overview-dcn.md-->
 <!--permalink: /helion/openstack/carrier/dcn/overview/--></p>
<!-- From http://h20628.www2.hp.com/km-ext/kmcsdirect/emr_na-c04518178-1.pdf HP DCN Overview -->
<p>Distributed Cloud Networking (DCN) is a Software-Defined Networking (SDN) solution that provides data center (DC) network virtualization and automatically establishes connectivity between compute resources upon their creation.</p>
<p>Leveraging programmable business logic and a powerful policy engine, the HP DCN provides an open and highly responsive solution that scales to meet the stringent needs of massive multi-tenant DCs. The HP DCN is a software solution that can be deployed over an existing DC IP network fabric.</p>
<p>The main components in the HP DCN solution are: Virtualized Services Directory (VSD) and Virtualized Services Directory Architect (VSD-A), Virtualized Services Controller (VSC) and Virtual Routing and Switching (VRS).</p>
<p>The complete component list follows:</p>
<ul>
<li>
<p>
<b>Virtualized Services Directory</b>. The HP VSD provides a flexible and hierarchical network policy framework that enables IT administrators to define and enforce resource policies in a user-friendly manner.</p>

<p>The VSD contains a multi-tenant service directory which supports role-based administration of users, compute, and network resources. It also manages network resource assignments such as IP addresses and ACLs.</p>
</li>
<li>
<p>
<b>Virtualized Services Controller</b>. The HP VSC is the industry's most powerful SDN controller. It functions as the robust network control plane for DCs, maintaining a full view of per-tenant network and service topologies.</p>

<p>Through the VSC, virtual routing and switching constructs are established to program the network forwarding plane, the HP VRS, using the OpenFlow protocol.</p>

<p>The VSC communicates with the VSD policy engine using Extensible Messaging and Presence Protocol (XMPP). An ejabberd XMPP server/cluster is used to distribute messages between the VSD and VSC entities.</p>

<p>Multiple VSC instances can be federated within and across DCs by leveraging MP-BGP.</p>
</li>
<li>
<p>
<b>Virtual Routing and Switching</b>. The HP VRS component is an enhanced Open vSwitch (OVS) implementation that constitutes the network forwarding plane. It encapsulates and de-encapsulates user traffic, enforcing L2-L4 traffic policies as defined by the VSD. The VRS tracks VM creation, migration and deletion events in order to dynamically adjust network connectivity.</p>
</li>
</ul>
<section id="hp-dcn-infrastructure-requirements-and-recommendations"> <title>HP DCN Infrastructure Requirements and Recommendations</title>
<p>In order to make use of the HP DCN, the data center environment must meet some key requirements as described in the following sections.</p>
<ul>
<li>
<p>
<b>Data Center IP Network</b>. The HP DCN can be used in any data center with a IP network. The HP VSC actively participates in the IP routing infrastructure. VSCs run OSPF or IS-IS for the IGP in addition to BGP. BGP is used to form a federation of VSCs and to exchange information with external networks. In addition, BGP is also used to exchange routing information with the data center provider edge router.</p>
</li>
<li>
<p>
<b>NTP Infrastructure</b>. Because the HP DCN is a distributed system, it is important that the different elements have a reliable reference clock to ensure the messages exchanged between the elements have meaningful
timestamps. HP DCN relies on each of the elements having clocks synchronized with Network Time Protocol (NTP).</p>

<p>The VSD and VRS applications rely on the NTP facilities provided by the host operating system. The VSC which is based on DCNOS has an NTP client.</p>

<p>HP recommends having at least two NTP reference clocks configured for each system with three reference clocks preferred.</p>
</li>
<li>
<p>
<b>Domain Name System</b>. In scaled HP DCN deployments, the VSD functional elements can be distributed across machines into clusters of machines where the failover and load sharing mechanisms for the clusters rely on being referenced as a single DNS entity. DNS naming of VSD and XMPP elements is also required for XMPP communication within the DCN.</p>
</li>
<li>
<p>
<b>Certificate Authority</b>. The northbound ReST API on the HP VSD is accessed within an SSL session. The VSD can use a selfsigned certificate, but having a certificate from a certificate authority will not require the client applications to process security warnings about unrecognized certificate authorities.</p>
</li>
</ul>
</section>
</body>
</topic>
