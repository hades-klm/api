<?php

namespace App\Form;

use App\Entity\User;
use App\Entity\Corporation;
use Symfony\Contracts\Translation\TranslatorInterface;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

class UserType extends AbstractType
{
    private $translator;

    public function __construct(TranslatorInterface $translator)
    {
        $this->translator = $translator;
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('nickname', TextType::class, [
                'help' => $this->translator->trans('user.nickname.help'),
                'attr' => ['placeholder' => $this->translator->trans('user.nickname.placeholder')],
            ])
            ->add('email', EmailType::class, [
                'attr' => ['placeholder' => $this->translator->trans('user.email.placeholder')],
            ])
            ->add('password', RepeatedType::class, [
                'type' => PasswordType::class,
                'invalid_message' => $this->translator->trans('user.password.invalid'),
                'options' => ['attr' => ['class' => 'password-field']],
                'required' => true,
                'first_options'  => ['label' => $this->translator->trans('user.password.first.label')],
                'second_options' => ['label' => $this->translator->trans('user.password.second.label')],
            ])
            ->add('corporation', EntityType::class, [
                'class' => Corporation::class,
                'choice_label' => 'name',
                'label' => $this->translator->trans('user.corporation.label')
            ])
            ->add('roles', ChoiceType::class, [
                'multiple' => true,
                'expanded' => true, // render check-boxes
                'choices' => [
                    'Admin' => 'ROLE_ADMIN',
                    'User' => 'ROLE_USER'
                ],
                'label' => $this->translator->trans('user.roles.label')
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
