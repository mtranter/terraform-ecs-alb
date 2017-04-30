#!/bin/bash
echo ECS_CLUSTER=${ecs_cluster_name} >> /etc/ecs/ecs.config
echo ECS_LOGLEVEL=${ecs_log_level} >> /etc/ecs/ecs.config
echo ECS_VERSION=${ecs_agent_version} >> /etc/ecs/ecs.config
