<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Role;

class Ability extends Model
{
    use HasFactory;

    protected $table = 'abilities';

    protected $guarded = [];

    public function roles()
    {
        return $this->belongsToMany(Role::class)->withTimestamps();
    }
}
