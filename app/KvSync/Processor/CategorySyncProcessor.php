<?php

namespace App\KvSync\Processor;

use App\KvSync\Helper;
use App\KvSync\Processor;
use App\Models\KvCategory;
use App\Models\SyncTimestamp;

class CategorySyncProcessor extends Processor {

    protected $endPoint = '/categories';
    protected $tableName =  'kv_categories';


    protected function syncModifiedItems($itemDataArray){
            $item = KvCategory::find($itemDataArray['categoryId']);
            if($item === null){
                $item = new KvCategory();    
                $item->id = $data['categoryId'];        
            }
            $item->parentId = array_key_exists('parentId', $itemDataArray)?$itemDataArray['parentId']:0;
            $item->categoryName =  $itemDataArray['categoryName'];
            $item->retailerId =  $itemDataArray['retailerId'];
            $item->isActive =  $itemDataArray['isActive'];
            $item->createdDate =  $itemDataArray['createdDate'];
            $item->modifiedDate =  array_key_exists('modifiedDate', $itemDataArray)?$itemDataArray['modifiedDate']:$itemDataArray['createdDate'];
            $item->save();

            $this->updateLastSyncTime($item->modifiedDate);
        
    }

   
}

