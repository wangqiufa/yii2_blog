<?php
use frontend\widgets\post\PostWidget;
use frontend\widgets\banner\BannerWidget;
use frontend\widgets\chat\ChatWidget;
use frontend\widgets\hot\HotWidget;
use frontend\widgets\tag\TagWidget;
$this->title = '博客';
?>

<div class="row">
    <div class="col-lg-9">
        <!--轮播图-->
        <?= BannerWidget::widget(); ?>

        <!--文章-->
        <?= PostWidget::widget(['limit' => 8, 'page' => true]); ?>
    </div>

    <div class="col-lg-3">
        <!-- 留言-->
        <?= ChatWidget::widget(); ?>

        <!--热门浏览-->
        <?= HotWidget::widget(); ?>

        <!--标签云-->
        <?= TagWidget::widget(); ?>
    </div>

</div>