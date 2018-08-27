<?php

/**
 * 前台基础控制器
 * Created by PhpStorm.
 * User: wangqiufa
 */

namespace frontend\controllers\base;

use yii\web\Controller;

class BaseController extends Controller
{
    public function beforeAction($action)
    {
        if (!parent::beforeAction($action)) {
            return false;
        }
        return true;
    }
}
