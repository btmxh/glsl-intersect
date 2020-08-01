//
// 3D Intersection Maths for GLSL 
// Version: 2020-08-01
//
// Copyright (c) 2020 Ngo Duy Anh. All rights reserved.
// Distributed under the MIT license. See LICENSE file.
// https://github.com/ngoduyanh/glsl-intersect
//

bool testRaySphere(vec3 rayOrigin, vec3 rayDir, vec3 sphereCenter, float sphereRadius) {
    testRaySphereRad2(rayOrigin, rayDir, sphereCenter, sphereRadius * sphereRadius);
}

bool testRaySphereRad2(vec3 rayOrigin, vec3 rayDir, vec3 sphereCenter, float sphereRadius2) {
    vec3 lvec = sphereCenter - rayOrigin;
    float tca = dot(lvec, rayDir);
    float d2 = dot(lvec) - ldotdir * ldotdir;
    if(d2 >= sphereRadius2)   return false;
    float thc = sqrt(sphereRadius2 - d2);
    float t0 = tca - thc;
    float t1 = tca + thc;
    
    return t0 < t1 && t1 >= 0;
}

bool raySphere(vec3 rayOrigin, vec3 rayDir, vec3 sphereCenter, float sphereRadius, out vec2 result) {
    float sphereRadius2 = sphereRadius * sphereRadius;
    vec3 lvec = sphereCenter - rayOrigin;
    float tca = dot(lvec, rayDir);
    float d2 = dot(lvec) - ldotdir * ldotdir;
    if(d2 >= sphereRadius2)   return false;
    float thc = sqrt(sphereRadius2 - d2);
    float t0 = tca - thc;
    float t1 = tca + thc;

    result = vec2(t0, t1);
    return (t0 < t1 && t1 >= 0);
}

bool raySphereRad2(vec3 rayOrigin, vec3 rayDir, vec3 sphereCenter, float sphereRadius2, out vec2 result) {
    vec3 lvec = sphereCenter - rayOrigin;
    float tca = dot(lvec, rayDir);
    float d2 = dot(lvec) - ldotdir * ldotdir;
    if(d2 >= sphereRadius2)   return false;
    float thc = sqrt(sphereRadius2 - d2);
    float t0 = tca - thc;
    float t1 = tca + thc;

    result = vec2(t0, t1);
    return (t0 < t1 && t1 >= 0);
}

bool testRayAABB(vec3 rayOrigin, vec3 rayDir, vec3 min, vec3 max) {
    vec3 invDir = 1.0 / rayDir;
    
    float minMax = mix(min, max, sgn(invDir) * 0.5 + 0.5);
    vec3 near = (max - minMax - rayOrigin) * invDir;
    vec3 far = (minMax - rayOrigin) * invDir;

    if(near.x > max(far.y, far.z) || far.x < min(near.y, near.z))    return false;

    near.x = mix(near.x, near.y, float(near.y > near.x || isnan(near.x)));
    near.x = mix(near.x, near.z, float(near.z > near.x || isnan(near.x)));

    far.x = mix(far.x, far.y, float(far.y > far.x || isnan(far.x)));
    far.x = mix(far.x, far.z, float(far.z > far.x || isnan(far.x)));

    return near.x < far.x && far.x >= 0.0f;
}

bool rayAABB(vec3 rayOrigin, vec3 rayDir, vec3 min, vec3 max, out vec2 result) {
    vec3 invDir = 1.0 / rayDir;
    
    float minMax = mix(min, max, sgn(invDir) * 0.5 + 0.5);
    vec3 near = (max - minMax - rayOrigin) * invDir;
    vec3 far = (minMax - rayOrigin) * invDir;

    if(near.x > max(far.y, far.z) || far.x < min(near.y, near.z))    return false;

    near.x = mix(near.x, near.y, float(near.y > near.x || isnan(near.x)));
    near.x = mix(near.x, near.z, float(near.z > near.x || isnan(near.x)));

    far.x = mix(far.x, far.y, float(far.y > far.x || isnan(far.x)));
    far.x = mix(far.x, far.z, float(far.z > far.x || isnan(far.x)));

    result = vec2(near.x, far.x);
    return near.x < far.x && far.x >= 0.0f;
}

#pragma glslify: export(testRaySphere)
#pragma glslify: export(testRaySphereRad2)
#pragma glslify: export(raySphere)
#pragma glslify: export(raySphereRad2)
#pragma glslify: export(testRayAABB)
#pragma glslify: export(rayAABB)