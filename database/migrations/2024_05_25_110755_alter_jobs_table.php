<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Legacy installs: Laravel's queue table was named `jobs` while listings lived in `job`.
        $jobsIsQueueTable = Schema::hasTable('jobs')
            && Schema::hasColumn('jobs', 'queue')
            && Schema::hasColumn('jobs', 'payload');

        if ($jobsIsQueueTable
            && Schema::hasTable('job')
            && Schema::hasColumn('job', 'job_type_id')) {
            if (! Schema::hasTable('queue_jobs')) {
                Schema::rename('jobs', 'queue_jobs');
            } else {
                Schema::drop('jobs');
            }
            Schema::rename('job', 'jobs');
        }

        if (! Schema::hasTable('jobs') || ! Schema::hasColumn('jobs', 'job_type_id')) {
            return;
        }

        if (Schema::hasColumn('jobs', 'user_id')) {
            return;
        }

        Schema::table('jobs', function (Blueprint $table) {
            $table->foreignId('user_id')->after('job_type_id')->constrained()->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        if (! Schema::hasTable('jobs') || ! Schema::hasColumn('jobs', 'user_id')) {
            return;
        }

        Schema::table('jobs', function (Blueprint $table) {
            $table->dropForeign(['user_id']);
            $table->dropColumn('user_id');
        });
    }
};
