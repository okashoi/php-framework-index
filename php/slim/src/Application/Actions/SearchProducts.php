<?php

namespace App\Application\Actions;

use PDO;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Views\Twig;

class SearchProducts
{
    // PDO のインスタンスはコンストラクタに渡される
    public function __construct(private readonly PDO $pdo)
    {
    }

    public function __invoke(Request $request, Response $response): Response
    {
        // RequestInterface を介して入力を受け取る
        $q = $request->getQueryParams()['q'] ?? '';

        $stmt = $this->pdo->prepare('SELECT name, price FROM products WHERE name LIKE ?');
        $stmt->execute(['%' . $q . '%']);

        $products = $stmt->fetchAll();

        // echo などは使わず、ResponseInterface のインスタンスを返す
        return Twig::fromRequest($request)
            ->render($response, 'search-products.html', compact('q', 'products'));
    }
}
