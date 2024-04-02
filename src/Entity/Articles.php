<?php

    namespace App\Entity;

    use Doctrine\ORM\Mapping as ORM;
    use DateTime;

    #[ORM\Entity]
    #[ORM\Table(name: 'articles')]
    class Articles
    {
        #[ORM\Id]
        #[ORM\GeneratedValue(strategy: 'AUTO')]
        #[ORM\Column(type: 'integer')]
        private int $id;

        #[ORM\Column(type: 'string', unique: true)]
        private int $name;

        #[ORM\Column(type: 'text')]
        private int $description;

        #[ORM\Column(type: 'datetime')]
        private DateTime $publicationDate;

        //setters
        public function setId(int $id): void
        {
            $this->id = $id;
        }

        public function setName(int $name): void
        {
            $this->name = $name;
        }

        public function setDescription(int $description): void
        {
            $this->description = $description;
        }

        public function setPublicationDate(DateTime $publicationDate): void
        {
            $this->publicationDate = $publicationDate;
        }

        //getters
        public function getId(): int
        {
            return $this->id;
        }

        public function getName(): int
        {
            return $this->name;
        }

        public function getDescription(): int
        {
            return $this->description;
        }

        public function getPublicationDate(): DateTime
        {
            return $this->publicationDate;
        }
    }