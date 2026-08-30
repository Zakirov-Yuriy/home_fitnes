plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.home_fitness"
    compileSdk = 36
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
    applicationId = "com.zak.home_fitness"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = 36
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            val keystoreProperties = mutableMapOf<String, String>()
            val keystorePropertiesFile = rootProject.file("key.properties")
            if (keystorePropertiesFile.exists()) {
                keystorePropertiesFile.readLines().forEach { line ->
                    val cleanLine = line.trim()
                    if (cleanLine.isEmpty() || cleanLine.startsWith("#") || !cleanLine.contains("=")) return@forEach
                    val (key, value) = cleanLine.split('=', limit = 2)
                    keystoreProperties[key.trim()] = value.trim()
                }
                val storeFilePath = keystoreProperties["storeFile"]
                if (!storeFilePath.isNullOrEmpty()) {
                    storeFile = file(storeFilePath)
                    storePassword = keystoreProperties["storePassword"]
                    keyAlias = keystoreProperties["keyAlias"]
                    keyPassword = keystoreProperties["keyPassword"]
                }
            }
        }
    }
    buildTypes {
        release {
            if (rootProject.file("key.properties").exists()) {
                signingConfig = signingConfigs.getByName("release")
            }
            isMinifyEnabled = false
            isShrinkResources = false
            // proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
    }
}

flutter {
    source = "../.."
}
