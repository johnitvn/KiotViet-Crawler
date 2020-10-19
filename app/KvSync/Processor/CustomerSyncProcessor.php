<?php

namespace App\KvSync\Processor;

use App\KvSync\Helper;
use App\KvSync\Processor;
use App\Models\KvCustomer;
use App\Models\SyncTimestamp;

class CustomerSyncProcessor extends Processor {

    protected $endPoint = '/customers';
    protected $tableName =  'kv_customers';


    protected function syncModifiedItems($itemDataArray){
            $item = KvCustomer::find($itemDataArray['id']);
            if($item === null){
                $item = new KvCustomer();    
                $item->id = $itemDataArray['id'];        
            }

            // {
            //     “id”: long, // ID khách hàng
            //     "code": string, // Mã khách hàng
            //      "name": string, // Tên khách hàng
            //     “gender”: Boolean?, // Giới tính (true: nam, false: nữ)
            //     "birthDate": date?, // Ngày sinh khách hàng
            //      "contactNumber": string, // Số điện thoại khách hàng
            //     “address”: string, // Địa chỉ khách hàng
            //      “locationName”: string, // Khu vực
            //     "email": string, // Email của khách hàng
            //     "organization": string, // Công ty
            //     "comment": string, // Ghi chú
            //     "taxCode": string, // Mã số thuế
            //     "debt": decimal, // Nợ hiện tại
            //      "totalInvoiced": decimal?, // Tổng bán
            //     "totalPoint": double?, // Tổng điểm
            //      "totalRevenue": decimal?,
            //      “retailerId”: int, // Id cửa hàng
            //     “modifiedDate”: datetime? // thời gian cập nhật
            //      “createdDate”: datetime,
            //     “rewardPoint”: long?// Điểm hiện tại
            //      }

            $item->code =  $itemDataArray['code'];
            $item->name =  $itemDataArray['name'];
            $item->gender =  $itemDataArray['gender'];
            $item->birthDate =  $this->existOrDefault($itemDataArray,'birthDate',null);
            $item->contactNumber =  $itemDataArray['contactNumber'];
            $item->address = $this->existOrDefault($itemDataArray,'address',null);
            $item->locationName =   $this->existOrDefault($itemDataArray,'locationName',null);
            $item->email =   $this->existOrDefault($itemDataArray,'email',null);
            $item->organization =  $this->existOrDefault($itemDataArray,'organization',null);
            $item->comment =  $this->existOrDefault($itemDataArray,'comment',null);
            $item->taxCode =  $this->existOrDefault($itemDataArray,'taxCode',null);
            $item->debt = $this->existOrDefault($itemDataArray,'taxCode',0);
            $item->totalInvoiced =  $this->existOrDefault($itemDataArray,'taxCode',0);
            $item->totalRevenue =  $this->existOrDefault($itemDataArray,'taxCode',0);
            $item->retailerId =  $itemDataArray['retailerId'];
            $item->rewardPoint =  $itemDataArray['rewardPoint'];
            $item->createdDate =  $itemDataArray['createdDate'];
            $item->modifiedDate =  array_key_exists('modifiedDate', $itemDataArray)?$itemDataArray['modifiedDate']:$itemDataArray['createdDate'];
            $item->save();

            $this->updateLastSyncTime($item->modifiedDate);
        
    }

   
}

