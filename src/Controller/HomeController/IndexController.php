<?php

    namespace App\Controller\HomeController;

    use Symfony\Component\HttpFoundation\Response;
    use Symfony\Component\Routing\Annotation\Route;
    use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

    class IndexController extends AbstractController
    {
        #[Route(path: '/', name: 'home')]
        public function index(): Response
        {
            return $this->render('index.html.twig');
        }
    }