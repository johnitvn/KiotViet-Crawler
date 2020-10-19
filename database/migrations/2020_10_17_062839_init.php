<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Init extends Migration
{
    /**
     * Set general table properties
     *
     * @return void
     */
    public function setGeneralTableProperties($table)
    {
        $table->datetime("updated_at");
        $table->datetime("created_at");
        $table->datetime("modifiedDate");
        $table->datetime("createdDate"); 
        $table->engine = 'InnoDB';
        $table->charset = 'utf8mb4';
        $table->collation = 'utf8mb4_unicode_ci';        
    }

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::create('Sync_Timestamps', function (Blueprint $table) {     
         $table->id();   
         $table->string("tablename")->unique();
         $table->datetime("lastSyncTime");
         $table->engine = 'InnoDB';
         $table->charset = 'utf8mb4';
         $table->collation = 'utf8mb4_unicode_ci';
      });

      /* CREATE TABLE IF NOT EXISTS `Kv_Bank_Accounts` (
         `id` int(11) NOT NULL AUTO_INCREMENT,
         `bankName` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
         `accountNumber` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
         `modifiedDate` datetime NOT NULL,
         `createdDate` datetime NOT NULL,
         `retailerId` int(11) NOT NULL,
         PRIMARY KEY (`id`)
       ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci; */
        Schema::create('Kv_Bank_Accounts', function (Blueprint $table) {     
            $table->id();   
            $table->string("bankName");
            $table->string("accountNumber");                       
            $table->integer("retailerId");
            $this->setGeneralTableProperties($table);
        });


        /* CREATE TABLE IF NOT EXISTS `Kv_Branches` (
         `id` int(11) NOT NULL AUTO_INCREMENT,
         `retailerId` int(11) NOT NULL,
         `branchName` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
         `address` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
         `locationName` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
         `wardName` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
         `contactNumber` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
         `email` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
         `modifiedDate` datetime NOT NULL,
         `createdDate` datetime NOT NULL,
         PRIMARY KEY (`id`)
       ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci; */
        Schema::create('Kv_Branches', function (Blueprint $table) {
            $table->id(); 
            $table->integer("retailerId");
            $table->string("branchName");
            $table->string("address");
            $table->string("locationName");
            $table->string("wardName");
            $table->string("contactNumber");
            $table->string("email");
            $this->setGeneralTableProperties($table);
        });

        /* CREATE TABLE IF NOT EXISTS `Kv_Categories` (
         `id` int(11) NOT NULL AUTO_INCREMENT,
         `parentId` int(11) NOT NULL,
         `categoryName` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
         `retailerId` int(11) NOT NULL,        
         `isActive` tinyint(1) NOT NULL,
         `createdDate` datetime NOT NULL,
         `modifiedDate` datetime NOT NULL,
         PRIMARY KEY (`id`)
       ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci; */
        Schema::create('Kv_Categories', function (Blueprint $table) {
            $table->id(); 
            $table->integer("parentId");
            $table->string("categoryName");
            $table->tinyInteger("isActive");
            $table->integer("retailerId");
            $this->setGeneralTableProperties($table);
        });

        /* CREATE TABLE IF NOT EXISTS `Kv_Customers` (
         `id` int(11) NOT NULL AUTO_INCREMENT,
         `code` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
         `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
         `gender` tinyint(1) NOT NULL,
         `contactNumber` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
         `retailerId` int(11) NOT NULL,
         `branchId` int(11) NOT NULL,
         `locationName` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
         `wardName` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
         `email` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
         `modifiedDate` datetime NOT NULL,
         `createdDate` datetime NOT NULL,
         `type` int(11) NOT NULL,
         `organization` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
         `groups` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
         `debt` decimal(10,0) NOT NULL,
         PRIMARY KEY (`id`)
       ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci; */
        Schema::create('Kv_Customers', function (Blueprint $table) {
           $table->id(); 
           $table->string("code");
           $table->string("name");
           $table->tinyInteger("gender"); 
           $table->datetime("birthDate")->nullable();
           $table->string("contactNumber")->nullable();
           $table->integer("retailerId");
           $table->integer("branchId");
           $table->string("locationName")->nullable();
           $table->string("wardName")->nullable();
           $table->string("email")->nullable();
           $table->datetime("modifiedDate");
           $table->datetime("createdDate");
           $table->integer("type")->nullable();
           $table->string("organization")->nullable();
           $table->string("groups");
           $table->decimal("debt",10,0);
           $this->setGeneralTableProperties($table);
        });

        /* CREATE TABLE IF NOT EXISTS `Kv_Invoice` (
         `id` int(11) NOT NULL AUTO_INCREMENT,
         `uuid` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
         `code` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
         `purchaseDate` datetime NOT NULL,
         `branchId` int(11) NOT NULL,
         `soldById` int(11) NOT NULL,
         `customerId` int(11) NOT NULL,
         `orderCode` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
         `total` decimal(10,0) NOT NULL,
         `totalPayment` decimal(10,0) NOT NULL,
         `discount` decimal(10,0) NOT NULL,
         `status` int(11) NOT NULL,
         `usingCod` tinyint(1) NOT NULL,
         `modifiedDate` datetime NOT NULL,
         `createdDate` datetime NOT NULL,
         PRIMARY KEY (`id`)
       ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci; */
        Schema::create('Kv_Invoice', function (Blueprint $table) {
           $table->id(); 
        });

        Schema::create('Kv_Invoice_Detail', function (Blueprint $table) {
           $table->id(); 
        });
        Schema::create('Kv_Order', function (Blueprint $table) {
           $table->id(); 
        });
        Schema::create('Kv_Order_Detail', function (Blueprint $table) {
           $table->id(); 
        });
        Schema::create('Kv_Product', function (Blueprint $table) {
           $table->id(); 
        });
        Schema::create('Kv_Product_Attribute', function (Blueprint $table) {
           $table->id(); 
        });
        Schema::create('Kv_Product_Image', function (Blueprint $table) {
           $table->id(); 
        });
        Schema::create('Kv_Product_Inventory', function (Blueprint $table) {
           $table->id(); 
        });
        Schema::create('Kv_Purchase_Order', function (Blueprint $table) {
           $table->id(); 
        });
        Schema::create('Kv_Purchase_Order_Detail', function (Blueprint $table) {
           $table->id(); 
        });
        Schema::create('Kv_Retailer', function (Blueprint $table) {
           $table->id(); 
        });
        Schema::create('Kv_Supplier', function (Blueprint $table) {
           $table->id(); 
        });
        Schema::create('Kv_Surcharge', function (Blueprint $table) {
           $table->id(); 
        });
        Schema::create('Kv_User', function (Blueprint $table) {
           $table->id(); 
        });
        Schema::create('Kv_Webhook', function (Blueprint $table) {
           $table->id(); 
        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('Sync_Timestamps');
        Schema::drop('Kv_Bank_Accounts');
        Schema::drop('Kv_Branches');
        Schema::drop('Kv_Categories');
        Schema::drop('Kv_Customers');
        Schema::drop('Kv_Invoice');
        Schema::drop('Kv_Invoice_Detail');
        Schema::drop('Kv_Order');
        Schema::drop('Kv_Order_Detail');
        Schema::drop('Kv_Product');
        Schema::drop('Kv_Product_Attribute');
        Schema::drop('Kv_Product_Image');
        Schema::drop('Kv_Product_Inventory');
        Schema::drop('Kv_Purchase_Order');
        Schema::drop('Kv_Purchase_Order_Detail');
        Schema::drop('Kv_Retailer');
        Schema::drop('Kv_Supplier');
        Schema::drop('Kv_Surcharge');
        Schema::drop('Kv_User');
        Schema::drop('Kv_Webhook');
       
    }
}
