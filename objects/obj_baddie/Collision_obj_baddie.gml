with (other.id)
{
    if ((other.state == ENEMY_STUN && other.thrown) || (other.state == ENEMY_GRABBED && obj_player.state.is(PLAYER_SUPERSLAM)))
        instance_destroy()
}
