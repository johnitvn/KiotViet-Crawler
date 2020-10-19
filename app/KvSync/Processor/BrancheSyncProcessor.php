<?php

namespace App\KvSync\Processor;

use App\KvSync\Helper;
use App\KvSync\Processor;
use App\Models\KvBranche;
use App\Models\SyncTimestamp;


class BrancheSyncProcessor extends Processor {

    protected $endPoint = '/branches';
    protected $tableName =  'kv_branches';


    protected function syncModifiedItems($itemDataArray){           
            $item = KvBranche::find($itemDataArray['id']);
            if($item === null){
                $item = new KvBranche();    
                $item->id = $itemDataArray['id'];        
            }
            $item->branchName =  $itemDataArray['branchName'];
            $item->address =  $itemDataArray['address'];
            $item->locationName =  array_key_exists('locationName', $itemDataArray)?$itemDataArray['locationName']:"";
            $item->wardName =  array_key_exists('wardName', $itemDataArray)?$itemDataArray['wardName']:"";
            $item->contactNumber = array_key_exists('contactNumber', $itemDataArray)?$itemDataArray['contactNumber']:"";
            $item->email = array_key_exists('email', $itemDataArray)?$itemDataArray['email']:"";
            $item->retailerId =  $itemDataArray['retailerId'];         
            $item->createdDate =  $itemDataArray['createdDate'];
            $item->modifiedDate =  array_key_exists('modifiedDate', $itemDataArray)?$itemDataArray['modifiedDate']:$itemDataArray['createdDate'];
            $item->save();
            $this->updateLastSyncTime($item->modifiedDate);        
    }

   
}

