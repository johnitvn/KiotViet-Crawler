<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\KvSync\SyncProcess\KvBankAccountSync;
use App\KvSync\SyncProcess\KvCategorySync;
use App\KvSync\SyncProcess\KvBrancheSync;
use App\KvSync\Helper;

class KvSyncCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:KvSync';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Crawler all data of kiotviet';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        Helper::log("============================");
        Helper::log("Start KiotViet Sync Process");
        $KvSyncProcessesFiles = scandir(app_path().'\KvSync\Processor');        
        foreach ($KvSyncProcessesFiles as $filename) {
            if($filename != '.'&&$filename != '..'){
                $className = '\App\KvSync\Processor\\'.str_replace('.php','',$filename);
                Helper::log("Start Processor: $className");
                new $className();
                Helper::log("End Processor: $className");
            }
        }
        Helper::log("End KiotViet Sync Process");
        Helper::log("============================");
        return 0;
    }
}
