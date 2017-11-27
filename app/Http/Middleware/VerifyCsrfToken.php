<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as BaseVerifier;

class VerifyCsrfToken extends BaseVerifier
{
    /**
     * The URIs that should be excluded from CSRF verification.
     *
     * @var array
     */
    protected $except = [
        'survey/send-carepostcard',
        'survey/add-tags',
        'survey/write-postcard',
        'admin/award/get-unit',
        'admin/post-on-newsfeed',
        'admin/load-data-comment',
        '/admin/employee/export-xls'
    ];
}
