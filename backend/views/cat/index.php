<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\CatSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Cat Models';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cat-model-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('添加分类', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'cat_name',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
