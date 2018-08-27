<?php
namespace frontend\models;

use Yii;
use yii\base\Model;
use common\models\UserModel;

/**
 * Signup form
 */
class SignupForm extends Model
{
    public $username;
    public $email;
    public $password;
    public $rePassword;
    public $verifyCode;


    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            ['username', 'trim'],
            ['username', 'required'],
            ['username', 'unique', 'targetClass' => '\common\models\UserModel', 'message' => Yii::t('common', 'This username has already been taken.')],
            ['username', 'string', 'min' => 3, 'max' => 16],
            ['username','match','pattern'=>'/^[(\x{4E00}-\x{9FA5})a-zA-Z]+[(\x{4E00}-\x{9FA5})a-zA-Z_\d]*$/u','message' => Yii::t('common', 'username rule label')],

            ['email', 'trim'],
            ['email', 'required'],
            ['email', 'email'],
            ['email', 'string', 'max' => 255],
            ['email', 'unique', 'targetClass' => '\common\models\UserModel', 'message' => Yii::t('common', 'This email address has already been taken.')],

            [['password', 'rePassword'], 'required'],
            [['password', 'rePassword'], 'string', 'min' => 6],

            ['verifyCode', 'captcha'],

            ['password', 'compare', 'compareAttribute' => 'rePassword', 'message' => Yii::t('common', 'two password is not same')],
        ];
    }

    /**
     * Signs user up.
     *
     * @return UserModel|null the saved model or null if saving fails
     */
    public function signup()
    {
        if (!$this->validate()) {
            return null;
        }
        
        $user = new UserModel();
        $user->username = $this->username;
        $user->email = $this->email;
        $user->setPassword($this->password);
        $user->generateAuthKey();
        
        return $user->save() ? $user : null;
    }

    public function attributeLabels()
    {
        return [
            'username' => Yii::t('common', 'Username'),
            'email' => Yii::t('common', 'Email'),
            'password' => Yii::t('common', 'Password'),
            'rePassword' => Yii::t('common', 'Repassword'),
            'verifyCode' => Yii::t('common', 'VeryfyCode'),
        ];
    }
}
