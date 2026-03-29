import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class Env {
    @EnviedField(varName: 'API_BASE_URL')
    static final String apiBaseUrl = _Env.apiBaseUrl;

    @EnviedField(varName: 'DIGEST_SALT')
    static final String digestSalt = _Env.digestSalt;

    @EnviedField(varName: 'API_KEY')
    static final String apiKey = _Env.apiKey;

    @EnviedField(varName: 'CLIENT_KEY')
    static final String clientKey = _Env.clientKey;

    @EnviedField(varName: 'CLIENT_SECRET')
    static final String clientSecret = _Env.clientSecret;

    @EnviedField(varName: 'BRGY_CODE')
    static final String brgyCode = _Env.brgyCode;
}