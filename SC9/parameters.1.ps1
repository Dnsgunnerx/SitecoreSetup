#define parameters
$prefix = "xp0"
$PSScriptRoot = "C:\resourcefiles"

$XConnectCollectionService = "$prefix.xconnect"
$xconnectHostName = "$prefix.sc"
$sitecoreSiteName = "$prefix.sc"
$SolrUrl = "https://solr:8983/solr"
$SolrRoot = "C:\solr\solr-6.6.2"
$SolrService = "solr-6.6.2"
$SqlServer = "EC2AMAZ-54EJVK3\SQLEXPRESS"
$SqlAdminUser = "dev"
$SqlAdminPassword = "dev123"
#install client certificate for xconnect






$certParams = @{
 Path = "$PSScriptRoot\xconnect-createcert.json"
 CertificateName = "$prefix.xconnect_client"
}



#install solr cores for xdb
$xConnectSolrParams = @{
 Path = "$PSScriptRoot\xconnect-solr.json"
 SolrUrl = $SolrUrl
 SolrRoot = $SolrRoot
 SolrService = $SolrService
 CorePrefix = $prefix
}




#deploy xconnect instance
$xconnectParams = @{
 Path = "$PSScriptRoot\xconnect-xp0.json"
 Package = "$PSScriptRoot\Sitecore 9.0.2 rev. 180604 (OnPrem)_xp0xconnect.scwdp.zip"
 LicenseFile = "$PSScriptRoot\license.xml"
 Sitename = $XConnectCollectionService
 XConnectCert = $certParams.CertificateName
 SqlDbPrefix = $prefix
SqlServer = $SqlServer
SqlAdminUser = $SqlAdminUser
 SqlAdminPassword = $SqlAdminPassword
 SolrCorePrefix = $prefix
 SolrURL = $SolrUrl
}


#install solr cores for sitecore
$sitecoreSolrParams = @{
 Path = "$PSScriptRoot\sitecore-solr.json"
 SolrUrl = $SolrUrl
 SolrRoot = $SolrRoot
 SolrService = $SolrService
 CorePrefix = $prefix
}


#install sitecore instance


$sitecoreParams = @{
 Path = "$PSScriptRoot\sitecore-XP0.json"
 Package = "$PSScriptRoot\Sitecore 9.0.2 rev. 180604 (OnPrem)_single.scwdp.zip"
 LicenseFile = "$PSScriptRoot\license.xml"
 SqlDbPrefix = $prefix
SqlServer = $SqlServer
SqlAdminUser = $SqlAdminUser
 SqlAdminPassword = $SqlAdminPassword
 SolrCorePrefix = $prefix
SolrUrl = $SolrUrl
 XConnectCert = $certParams.CertificateName
 Sitename = $sitecoreSiteName
 XConnectCollectionService = "https://$XConnectCollectionService" 
}