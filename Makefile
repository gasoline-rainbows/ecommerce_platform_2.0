THIS_FILE := $(lastword $(MAKEFILE_LIST))

all: start

.PHONY: stop clean build tars start new

build: tars
	if ! docker images | grep take2l/web >/dev/null; then cd web && docker build -t take2l/web . ; fi

start: build stop
	rm magento2/docker-compose.yml && cp docker-compose.yml magento2/docker-compose.yml && cd magento2 && docker-compose up -d

stop:
	docker stop magento2_database_1 && docker rm magento2_database_1 || true
	docker stop magento2_web_1 && docker rm magento2_web_1 || true

clean: stop
	docker rmi take2l/web || true
	docker rmi take2l/db || true
	docker rmi mysql || true

superclean: stop
	docker rmi $$(docker images -q) || true

tars:
	docker load -i tars/db.tar
	docker load -i tars/site.tar
	docker load -i tars/bitnami.tar

new:
	docker stop $$(docker ps -q) || true
	docker rm $$(docker ps -a -q) || true
	docker rmi $$(docker images -q) || true
	sudo rm -rf volumes/mysql
	sudo rm -rf magento2
	tar -xvzf magento2.tar.gz
	$(MAKE) -f $(THIS_FILE) start

sleep:
	sleep 30

blahblah:
	curl -H "Host: localhost:81" \
		 -H "User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0" \
		 -H "Accept: application/json, text/plain, */*" \
		 -H "Accept-Language: en-US,en;q=0.5" -H "Accept-Encoding: gzip, deflate" \
		 -H "Content-Type: application/json;charset=utf-8" \
		 -H "Referer: http://localhost/setup/" \
		 -H "Content-Length: 7569" \
		 -H "Cookie: PHPSESSID=a28a8232d79f5565317393bc8b84efe5; admin=df041224708d53c59d19ce488a9c40ff; mage-messages=; mage-translation-storage=%7B%7D; mage-translation-file-version=%7B%7D; mage-cache-storage=%7B%7D; mage-cache-storage-section-invalidation=%7B%7D; section_data_ids=%7B%22cart%22%3A1491781070%7D; mage-cache-sessid=true" \
		 -H "Connection: keep-alive" \
		 -H "Pragma: no-cache" \
		 -H "Cache-Control: no-cache" -X POST -d \
		 '{
		 	"db":{
		 		"useExistingDb":1,
		 		"useAccess":1,
		 		"host":"database",
		 		"user":"magento2",
		 		"name":"magento2",
		 		"password":"mySQLpassword"
		 		},
		 	"admin":{
		 		"passwordStatus":{
		 			"class":"good",
		 			"label":"Good"
		 			},
		 		"password":"Gateway8",
		 		"username":"root",
		 		"email":"thomaslyons77@gmail.com",
		 		"confirm":"Gateway8"
		 	},
		 	"store":{
		 		"timezone":"UTC",
		 		"currency":"USD",
		 		"language":"en_US",
		 		"useSampleData":false,
		 		"cleanUpDatabase":false,
		 		"loadedAllModules":true,
		 		"showModulesControl":true,
		 		"selectAll":true,
		 		"allModules":[
		 			"Magento_AdminNotification",
		 			"Magento_AdvancedPricingImportExport",
		 			"Magento_Authorization",
		 			"Magento_Authorizenet",
		 			"Magento_Backend",
		 			"Magento_Backup",
		 			"Magento_Braintree",
		 			"Magento_Bundle",
		 			"Magento_BundleImportExport",
		 			"Magento_CacheInvalidate",
		 			"Magento_Captcha",
		 			"Magento_Catalog",
		 			"Magento_CatalogImportExport",
		 			"Magento_CatalogInventory",
		 			"Magento_CatalogRule",
		 			"Magento_CatalogRuleConfigurable",
		 			"Magento_CatalogSearch",
		 			"Magento_CatalogUrlRewrite",
		 			"Magento_CatalogWidget",
		 			"Magento_Checkout",
		 			"Magento_CheckoutAgreements",
		 			"Magento_Cms",
		 			"Magento_CmsUrlRewrite",
		 			"Magento_Config",
		 			"Magento_ConfigurableImportExport",
		 			"Magento_ConfigurableProduct",
		 			"Magento_Contact",
		 			"Magento_Cookie",
		 			"Magento_Cron",
		 			"Magento_CurrencySymbol",
		 			"Magento_Customer",
		 			"Magento_CustomerImportExport",
		 			"Magento_Deploy",
		 			"Magento_Developer",
		 			"Magento_Dhl",
		 			"Magento_Directory",
		 			"Magento_Downloadable",
		 			"Magento_DownloadableImportExport",
		 			"Magento_Eav",
		 			"Magento_Email",
		 			"Magento_EncryptionKey",
		 			"Magento_Fedex",
		 			"Magento_GiftMessage",
		 			"Magento_GoogleAdwords",
		 			"Magento_GoogleAnalytics",
		 			"Magento_GoogleOptimizer",
		 			"Magento_GroupedImportExport","Magento_GroupedProduct","Magento_ImportExport","Magento_Indexer","Magento_Integration","Magento_LayeredNavigation","Magento_Marketplace","Magento_MediaStorage","Magento_Msrp","Magento_Multishipping","Magento_NewRelicReporting","Magento_Newsletter","Magento_OfflinePayments","Magento_OfflineShipping","Magento_PageCache","Magento_Payment","Magento_Paypal","Magento_Persistent","Magento_ProductAlert","Magento_ProductVideo","Magento_Quote","Magento_Reports","Magento_RequireJs","Magento_Review","Magento_Rss","Magento_Rule","Magento_Sales","Magento_SalesInventory","Magento_SalesRule","Magento_SalesSequence","Magento_SampleData","Magento_Search","Magento_Security","Magento_SendFriend","Magento_Shipping","Magento_Sitemap","Magento_Store","Magento_Swagger","Magento_Swatches","Magento_SwatchesLayeredNavigation","Magento_Tax","Magento_TaxImportExport","Magento_Theme","Magento_Translation","Magento_Ui","Magento_Ups","Magento_UrlRewrite","Magento_User","Magento_Usps","Magento_Variable","Magento_Vault","Magento_Version","Magento_Webapi","Magento_WebapiSecurity","Magento_Weee","Magento_Widget","Magento_Wishlist","Plazathemes_Bannerslider","Plazathemes_Bestsellerproduct","Plazathemes_Blog","Plazathemes_Brandslider","Plazathemes_Categorytab","Plazathemes_Featureproductslider","Plazathemes_Hozmegamenu","Plazathemes_Layout","Plazathemes_Loadjs","Plazathemes_Newproductslider","Plazathemes_Newsletterpopup","Plazathemes_Override","Plazathemes_Pricecountdown","Plazathemes_Producttab","Plazathemes_Randomproductslider","Plazathemes_Recentproductslider","Plazathemes_Template","Plazathemes_Testimonial","Plazathemes_Themeoptions"],"errorFlag":false,"showError":false,"selectedModules":["Magento_AdminNotification","Magento_AdvancedPricingImportExport","Magento_Authorization","Magento_Authorizenet","Magento_Backend","Magento_Backup","Magento_Braintree","Magento_Bundle","Magento_BundleImportExport","Magento_CacheInvalidate","Magento_Captcha","Magento_Catalog","Magento_CatalogImportExport","Magento_CatalogInventory","Magento_CatalogRule","Magento_CatalogRuleConfigurable","Magento_CatalogSearch","Magento_CatalogUrlRewrite","Magento_CatalogWidget","Magento_Checkout","Magento_CheckoutAgreements","Magento_Cms","Magento_CmsUrlRewrite","Magento_Config","Magento_ConfigurableImportExport","Magento_ConfigurableProduct","Magento_Contact","Magento_Cookie","Magento_Cron","Magento_CurrencySymbol","Magento_Customer","Magento_CustomerImportExport","Magento_Deploy","Magento_Developer","Magento_Dhl","Magento_Directory","Magento_Downloadable","Magento_DownloadableImportExport","Magento_Eav","Magento_Email","Magento_EncryptionKey","Magento_Fedex","Magento_GiftMessage","Magento_GoogleAdwords","Magento_GoogleAnalytics","Magento_GoogleOptimizer","Magento_GroupedImportExport","Magento_GroupedProduct","Magento_ImportExport","Magento_Indexer","Magento_Integration","Magento_LayeredNavigation","Magento_Marketplace","Magento_MediaStorage","Magento_Msrp","Magento_Multishipping","Magento_NewRelicReporting","Magento_Newsletter","Magento_OfflinePayments","Magento_OfflineShipping","Magento_PageCache","Magento_Payment","Magento_Paypal","Magento_Persistent","Magento_ProductAlert","Magento_ProductVideo","Magento_Quote","Magento_Reports","Magento_RequireJs","Magento_Review","Magento_Rss","Magento_Rule","Magento_Sales","Magento_SalesInventory","Magento_SalesRule","Magento_SalesSequence","Magento_SampleData","Magento_Search","Magento_Security","Magento_SendFriend","Magento_Shipping","Magento_Sitemap","Magento_Store","Magento_Swagger","Magento_Swatches","Magento_SwatchesLayeredNavigation","Magento_Tax","Magento_TaxImportExport","Magento_Theme","Magento_Translation","Magento_Ui","Magento_Ups","Magento_UrlRewrite","Magento_User","Magento_Usps","Magento_Variable","Magento_Vault","Magento_Version","Magento_Webapi","Magento_WebapiSecurity","Magento_Weee","Magento_Widget","Magento_Wishlist","Plazathemes_Bannerslider","Plazathemes_Bestsellerproduct","Plazathemes_Blog","Plazathemes_Brandslider","Plazathemes_Categorytab","Plazathemes_Featureproductslider","Plazathemes_Hozmegamenu","Plazathemes_Layout","Plazathemes_Loadjs","Plazathemes_Newproductslider","Plazathemes_Newsletterpopup","Plazathemes_Override","Plazathemes_Pricecountdown","Plazathemes_Producttab","Plazathemes_Randomproductslider","Plazathemes_Recentproductslider","Plazathemes_Template","Plazathemes_Testimonial","Plazathemes_Themeoptions"],"disabledModules":["Magento_Authorization","Magento_Backend","Magento_Backup","Magento_Bundle","Magento_Catalog","Magento_CatalogImportExport","Magento_CatalogInventory","Magento_CatalogRule","Magento_CatalogSearch","Magento_CatalogUrlRewrite","Magento_Checkout","Magento_Cms","Magento_CmsUrlRewrite","Magento_Config","Magento_ConfigurableProduct","Magento_Contact","Magento_Cookie","Magento_Cron","Magento_Customer","Magento_Developer","Magento_Directory","Magento_Downloadable","Magento_Eav","Magento_Email","Magento_GiftMessage","Magento_GoogleAnalytics","Magento_GroupedProduct","Magento_ImportExport","Magento_Indexer","Magento_Integration","Magento_MediaStorage","Magento_Msrp","Magento_Newsletter","Magento_PageCache","Magento_Payment","Magento_Paypal","Magento_ProductAlert","Magento_Quote","Magento_Reports","Magento_RequireJs","Magento_Review","Magento_Rss","Magento_Rule","Magento_Sales","Magento_SalesRule","Magento_SalesSequence","Magento_Search","Magento_Security","Magento_Shipping","Magento_Store","Magento_Tax","Magento_Theme","Magento_Translation","Magento_Ui","Magento_UrlRewrite","Magento_User","Magento_Variable","Magento_Vault","Magento_Webapi","Magento_Widget",
		 			"Magento_Wishlist"
		 			],
		 		"errorMessage":"",
		 		"force":false,
		 		"advanced":{
		 			"expanded":false
		 			}
		 		},
		 	"config":{
		 		"address":{
		 			"base_url":"http://localhost/",
		 			"auto_base_url":"http://localhost/",
		 			"actual_base_url":"http://localhost/",
		 			"admin":"admin"
		 			},
		 		"https":{
		 			"front":false,
		 			"admin":false,
		 			"text":"https://localhost/"
		 			},
		 		"rewrites":{
		 			"allowed":true
		 			},
		 		"encrypt":{
		 			"key":null,
		 			"type":"magento"
		 			},
		 		"advanced":{
		 			"expanded":false
		 			},
		 		"sessionSave":{
		 			"type":"files",
		 			"error":false
		 			}
		 		}
		 	}
		 ' http://localhost/setup/index.php/install/start
	docker exec -it magento2_web_1 crontab /etc/cron.d/magento-cron
	docker exec -it magento2_web_1 crontab -u www-data /etc/cron.d/magento-cron
	docker exec -it magento2_web_1 crontab -l
	docker exec -it magento2_web_1 crontab -u www-data -l
	docker exec -it -d magento2_web_1 cron

continue_after_curl:
	docker exec -it magento2_web_1 mkdir /var/www/var/generation/Magento/Catalog/Model/Product/Attribute/Backend
	docker exec -it magento2_web_1 crontab /etc/cron.d/magento-cron
	docker exec -it magento2_web_1 crontab -u www-data /etc/cron.d/magento-cron
	docker exec -it magento2_web_1 crontab -l
	docker exec -it magento2_web_1 crontab -u www-data -l
	docker exec -it -d magento2_web_1 cron
	docker exec -it magento2_web_1 chmod -R +777 /var/www/var
#	-docker exec -it magento2_web_1 php bin/magento indexer:reindex
#	adminout=$$(curl http://localhost/admin) && echo $$adminout
#	docker exec -it magento2_web_1 chmod -R +775 /var/www/var/generation/Magento/Catalog/Model/Product/Attribute/Backend
#	docker exec -it magento2_web_1 php bin/magento indexer:reindex
#	docker exec -it magento2_web_1 php ./gocron
#	docker exec -it magento2_web_1 ./gocron
#	docker exec -it magento2_web_1 php bin/magento setup:install --db-host database --db-name magento2 --db-user magento2 --db-password mySQLpassword --base-url http://localhost --admin-user root --admin-password Gateway8 --admin-email thomaslyons77@gmail.com --admin-firstname Tom --admin-lastname Lyons

install:
	docker exec -it magento2_web_1 php bin/magento setup:install --base-url=http://127.0.0.1/ \
    --db-host=database --db-name=magento2 \
    --db-user=magento2 --db-password=mySQLpassword \
    --admin-firstname=Tom --admin-lastname=Lyons --admin-email=thomaslyons77@gmail.com \
    --admin-user=root --admin-password=Gateway8 --language=en_US \
    --currency=USD --timezone=America/Chicago

