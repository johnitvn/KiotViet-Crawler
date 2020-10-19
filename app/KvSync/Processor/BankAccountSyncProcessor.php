<?php

namespace App\KvSync\Processor;

use App\KvSync\Helper;
use App\KvSync\Processor;
use App\Models\KvBankAccount;
use App\Models\SyncTimestamp;


class BankAccountSyncProcessor extends Processor {

    protected $endPoint = '/bankaccounts';
    protected $tableName =  'kv_bank_accounts';

    protected function syncModifiedItems($itemDataArray){
            $item = KvBankAccount::find($itemDataArray['id']);
            if($item === null){
                $item = new KvBankAccount();    
                $item->id = $itemDataArray['id'];        
            }
            $item->bankName =  $itemDataArray['bankName'];
            $item->accountNumber =  $itemDataArray['accountNumber'];
            $item->retailerId =  $itemDataArray['retailerId'];
            $item->createdDate =  $itemDataArray['createdDate'];
            $item->modifiedDate =  array_key_exists('modifiedDate', $itemDataArray)?$itemDataArray['modifiedDate']:$itemDataArray['createdDate'];
            $item->save();

            $this->updateLastSyncTime($item->modifiedDate);
    }

   
}

