package com.dchprojects.mydictionaryrestapi.api;

import com.dchprojects.mydictionaryrestapi.configuration.security.JwtTokenUtil;
import com.dchprojects.mydictionaryrestapi.domain.dto.AuthRequest;
import com.dchprojects.mydictionaryrestapi.domain.dto.AuthResponse;
import com.dchprojects.mydictionaryrestapi.domain.dto.CreateUserRequest;
import com.dchprojects.mydictionaryrestapi.domain.dto.JwtTokenResponse;
import com.dchprojects.mydictionaryrestapi.domain.entity.UserEntity;
import com.dchprojects.mydictionaryrestapi.domain.entity.role.RoleNameString;
import com.dchprojects.mydictionaryrestapi.service.UserService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.security.RolesAllowed;
import javax.validation.Valid;
import javax.validation.ValidationException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

@Tag(name = "Authentication")
@RestController @RequestMapping(path = "/api/v1/auth")
@RolesAllowed({RoleNameString.ROLE_USER, RoleNameString.ROLE_ADMIN})
@RequiredArgsConstructor
public class AuthApi {

    private final AuthenticationManager authenticationManager;
    private final JwtTokenUtil jwtTokenUtil;
    private final UserService userService;

    @PostMapping("/login")
    public ResponseEntity<AuthResponse> login(@RequestBody @Valid AuthRequest request) {
        try {
            Authentication authenticate = authenticationManager
                    .authenticate(new UsernamePasswordAuthenticationToken(request.getNickname(), request.getPassword()));

            User user = (User) authenticate.getPrincipal();

            if (userService.existsByNickname(user.getUsername())) {
                UserEntity userEntity = userService.findByNickname(user.getUsername()).get();
                JwtTokenResponse jwtTokenResponse = jwtTokenUtil.generateAccessToken(userEntity);
                Timestamp timestamp = new Timestamp(jwtTokenResponse.getExpirationDate().getTime());
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
                return ResponseEntity.ok(new AuthResponse(jwtTokenResponse.getAccessToken(), simpleDateFormat.format(timestamp)));
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (BadCredentialsException ex) {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }
    }

    @PostMapping("/register")
    public ResponseEntity<UserEntity> register(@RequestBody @Valid CreateUserRequest createUserRequest) {
        try {
            return new ResponseEntity<>(userService.createUser(createUserRequest), HttpStatus.OK);
        } catch (ValidationException validationException) {
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }
    }

}
