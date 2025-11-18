<?php

namespace App\Exports;

use App\Models\Application;
use Maatwebsite\Excel\Concerns\FromCollection;

class ApplicationsExport implements FromCollection
{
    protected ?int $jobId;

    public function __construct(?int $jobId = null)
    {
        $this->jobId = $jobId;
    }

    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        $query = Application::query();
        if ($this->jobId) {
            $query->where('job_id', $this->jobId);
        }
        return $query->get();
    }
}
