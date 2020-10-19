<?php

namespace App\KvSync;

use \Illuminate\Database\Eloquent\Model;
use \App\Models\KvBankAccount;
use \App\Models\SyncTimestamp;
use \KVSDK\KVClient;
use \KVSDK\Config;

abstract class DetailProcessor extends Processor{

 
    protected $tableName;
    protected $endPoint;
    protected $pageSize = 100;

    public function __construct(){       
        $client = new KVClient(new Config(env('KIOTVIET_ID'), env('KIOTVIET_SECRET'), env('KIOTVIET_RETAILER')));       
        $this->getData($client);
        return;        
    }

    /**
     * 
     */
    protected function getData(KVClient $client){    
        
        Helper::log('Send request to: '.$this->endPoint);
        $response = $client->get($this->endPoint,[
            'format'=>'json',
            'orderBy'=>'modifiedDate',
            'orderDirection'=>'asc',
            'pageSize'=>$this->pageSize,
            'includerRemoveIds' => 'true',
            'lastModifiedFrom'=>$lastTimeSyncData
        ]);  
        
        if($response['status']=='success'){
            Helper::log("Status:". $response['status']);
            Helper::log("Msg: ". $response['message']);
            $this->sync($response['data']);
        }else{
            Helper::log("Status:". $response['status']);
            Helper::log("Msg: ". $response['message']);
            Helper::log("Error: ". $response['errorCode']. " - ". $response['error']);
        }       
    }
    

    protected function sync($data){
        Helper::log("Total item:". $data['total'].",  Page Size:". $data['pageSize']);

        if(array_key_exists('removeIds', $data)){
            Helper::log("Remove Ids:". implode(", ", $data['removeIds']));
            $ids = $data['removeIds'];
            foreach ($ids as $id) {
                $this->syncDeletedItems( $data['removeIds']);
            }            
        }else{
            Helper::log("Remove Ids: NULL");
        }

        $items = $data['data'];
        foreach ($items as $item){
            $this->syncModifiedItems($item);
        }
        
    }
    
    abstract protected function syncModifiedItems($datas);

    
}

