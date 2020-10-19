<?php

namespace App\KvSync\Processor;

use App\KvSync\Helper;
use App\KvSync\DetailProcessor;
use App\Models\KvCategory;
use App\Models\SyncTimestamp;

class InvoiceDetailSyncProcessor extends DetailProcessor {

    protected $endPoint = '/categories';
    protected $tableName =  'kv_categories';


    protected function syncModifiedItems($itemDataArray){
        
    }

   
}

