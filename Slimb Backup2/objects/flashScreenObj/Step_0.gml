if (flashAlpha > 0)
{
    flashAlpha -= flashSpeed;

    if (flashAlpha <= 0)
    {
        instance_destroy();
    }
}