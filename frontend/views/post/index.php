<?php
use frontend\widgets\post\PostWidget;
use yii\helpers\Url;
use frontend\widgets\hot\HotWidget;
use frontend\widgets\tag\TagWidget;

$this->title = Yii::t('common', 'Post');
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="row">
    <div class="col-lg-9">
        <?= PostWidget::widget(['limit' => 10, 'page' => true]) ?>
    </div>

    <div class="col-lg-3">
        <div class="panel">
            <?php if (!Yii::$app->user->isGuest): ?>
            <a href="<?= Url::to('/post/create') ?>" class="btn btn-success btn-block btn-post">创建文章</a>
            <?php endif; ?>
        </div>

        <!--热门浏览-->
        <?= HotWidget::widget(); ?>
        <!--标签云-->
        <?= TagWidget::widget(); ?>
    </div>
</div>