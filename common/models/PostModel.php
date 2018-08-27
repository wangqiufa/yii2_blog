<?php

namespace common\models;

use common\models\base\BaseModel;
use Yii;

/**
 * This is the model class for table "posts".
 *
 * @property int $id 自增ID
 * @property string $title 标题
 * @property string $summary 摘要
 * @property string $content 内容
 * @property string $label_img 标签图
 * @property int $cat_id 分类id
 * @property int $user_id 用户id
 * @property string $user_name 用户名
 * @property int $is_valid 是否有效：0-未发布 1-已发布
 * @property int $created_at 创建时间
 * @property int $updated_at 更新时间
 */
class PostModel extends BaseModel
{
    const IS_VALID = 1; // 已发布
    const NO_VALID = 0; // 未发布

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'posts';
    }

    /**
     * 根据文章id 获取 关联的 RelationPostTag 数据
     * @return \yii\db\ActiveQuery
     */
    public function getRelate()
    {
        return $this->hasMany(RelationPostTagModel::className(), ['post_id' => 'id']);
    }

    /**
     * 获取文章扩展属性信息
     * @return \yii\db\ActiveQuery
     */
    public function getExtend()
    {
        return $this->hasOne(PostExtendModel::className(), ['post_id' => 'id']);
    }

    /**
     * 获取分类信息
     * @return \yii\db\ActiveQuery
     */
    public function getCat()
    {
        return $this->hasOne(CatModel::className(), ['id' => 'cat_id']);
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['content'], 'string'],
            [['cat_id', 'user_id', 'is_valid', 'created_at', 'updated_at'], 'integer'],
            [['title', 'summary', 'label_img', 'user_name'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => '标题',
            'summary' => '简介',
            'content' => '内容',
            'label_img' => '缩略图',
            'cat_id' => '分类',
            'user_id' => '用户ID',
            'user_name' => '用户名',
            'is_valid' => '状态',
            'created_at' => '创建时间',
            'updated_at' => '更新时间',
        ];
    }
}
