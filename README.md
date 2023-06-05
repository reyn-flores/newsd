# Newsd - Flutter News App

Newsd is a cross-platform news application developed using Flutter and Dart. The app allows users to browse and read the latest news articles from various sources.

## Features

- Browse and read news articles from different sources
- Filter news articles by category or search by keywords
- Save favorite articles for offline reading
- Dark mode support

## Screenshots

<img src="https://github.com/rainman-tech/newsd/blob/main/screenshots/Screenshot_1685941087.png" width="250"> <img src="https://github.com/rainman-tech/newsd/blob/main/screenshots/Screenshot_1685941093.png" width="250">
<img src="https://github.com/rainman-tech/newsd/blob/main/screenshots/Screenshot_1685941108.png" width="250"> <img src="https://github.com/rainman-tech/newsd/blob/main/screenshots/Screenshot_1685941117.png" width="250">

#### Check out the figma file here:
[https://www.figma.com/file/CcT7ylzzzCcd0n11l8vyUa/Notr?type=design&node-id=0%3A1&t=Fet44RRrDoAlQz4f-1](https://www.figma.com/file/QfAuhj6uLlKy3IqQgie8Rn/Newsd?type=design&node-id=0%3A1&t=YvjXl0ZdYHiBCA0j-1)

## Libraries Used

The following libraries were used in the development of Newsd:

1. [flutter_bloc](https://pub.dev/packages/flutter_bloc): A state management library that follows the BLoC (Business Logic Component) architecture pattern, providing a convenient way to manage the application's state.
2. [get_it](https://pub.dev/packages/get_it): A service locator library that helps with dependency injection. It allows easy access to instances of classes throughout the application.
3. [dio](https://pub.dev/packages/dio): A powerful HTTP client for Dart. It simplifies the process of making network requests and handling responses.
4. [retrofit](https://pub.dev/packages/retrofit): A library that generates type-safe HTTP clients from annotated Dart classes. It works well with Dio and simplifies the process of defining and making API requests.
5. [auto_route](https://pub.dev/packages/auto_route): A code generation library for Flutter navigation. It helps in defining and generating navigation routes in a type-safe manner.

## Project Structure

The project is structured using the Clean Architecture pattern, which promotes separation of concerns and makes the codebase more modular and maintainable. The project structure follows the following layers:

- `data`: Contains data-related classes, such as repositories, data sources, and API clients.
- `domain`: Defines the business logic and entities of the application.
- `presentation`: Contains the UI components, including screens, widgets, and blocs.

## API Key

Newsd uses the open-source API provided by [newsapi.org](https://newsapi.org/docs/endpoints/everything) for fetching the news articles. To run the app, you will need to obtain an API key by creating an account on their website.
