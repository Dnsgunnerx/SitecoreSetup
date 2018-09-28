<#
    Install script for a non-scaled XP instance on a single machine

    All sitecore applications/services are installed on the current machine
    All databases on installed on the given SqlServer
#>

# Bring parameters into scope
. $PSScriptRoot\parameters.1.ps1

### Run installs




## xconnect-createcert.json
Install-SitecoreConfiguration @certParams -Verbose

## xconnect-solr.json
Install-SitecoreConfiguration @xConnectSolrParams

## xconnect-xp0.json
Install-SitecoreConfiguration @xconnectParams

## Instsll solr for Sitecore
Install-SitecoreConfiguration @sitecoreSolrParams


## sitecore-XP0.json
Install-SitecoreConfiguration @sitecoreParams

